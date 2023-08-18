import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData;
import 'package:vehicle_doctor_mobile/common/entities/entities.dart';
import 'package:vehicle_doctor_mobile/common/store/user.dart';
import 'package:vehicle_doctor_mobile/common/utils/loading.dart';
import 'package:vehicle_doctor_mobile/common/utils/print.dart';
import 'package:vehicle_doctor_mobile/common/values/cache.dart';
import 'package:vehicle_doctor_mobile/common/values/server.dart';
import 'package:vehicle_doctor_mobile/common/widgets/widgets.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: serverApiUrl,

      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      connectTimeout: const Duration(seconds: 5),
      // receiveTimeout: const Duration(microseconds: 5000),
      headers: {
        "X-Client": Platform.isAndroid ? apiAndriodKey : apiIOSKey,
      },
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    // (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
    //   final client = HttpClient();
    //   client.badCertificateCallback =
    //       (X509Certificate cert, String host, int port) => true;
    //   return client;
    // };

    // CookieJar cookieJar = CookieJar();
    // dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        myPrint("Request body => ${options.data.toString()}");
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        // Do something with response data
        myPrint("Response body => ${response.toString()}");
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) {
        Loading.dismiss();
        myPrint("Error body => ${e.response.toString()}");
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
        return handler.next(e); //continue
      },
    ));
  }

  void onError(ErrorEntity eInfo) {
    myPrint('error.code -> ${eInfo.code}, error.message -> ${eInfo.message}');
    switch (eInfo.code) {
      case 401:
        UserStore.to.onLogout();
        MyDialog.error(
          text: eInfo.message,
          errorCode: eInfo.errorCode,
        );
        break;
      case 400 || 422:
        MyDialog.error(
          text: eInfo.message,
          errorCode: eInfo.errorCode,
        );
        break;
      default:
        MyDialog.error(
          text: eInfo.message,
          errorCode: eInfo.errorCode,
        );
        break;
    }
  }

  ErrorEntity createErrorEntity(DioException error) {
    if (error.response?.data != null) {
      var errorBase = ErrorBase.fromJson(error.response?.data);
      if (errorBase.code == null) {
        var validationModelError =
            ValidationModelError.fromJson(error.response?.data);
        var errorMessage = '';
        validationModelError.errors?.asMap().forEach(
              (i, v) => errorMessage +=
                  i == 0 ? v.message ?? "" : "\n \n${v.message}",
            );
        return ErrorEntity(
          code: error.response?.statusCode,
          message: errorMessage != ''
              ? errorMessage
              : "Something went wrong. Please try again later.",
          errorCode: errorBase.code,
        );
      } else {
        return ErrorEntity(
          code: error.response?.statusCode,
          message: errorBase.message ??
              "Something went wrong. Please try again later.",
          errorCode: errorBase.code,
        );
      }
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorEntity(
          code: error.response?.statusCode,
          message: "Operation cannceled",
        );
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(
          code: error.response?.statusCode,
          message: "Connection timeout",
        );
      case DioExceptionType.sendTimeout:
        return ErrorEntity(
          code: error.response?.statusCode,
          message: "Send request timeout",
        );
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(
          code: error.response?.statusCode,
          message: "Receive timeout",
        );
      default:
        return ErrorEntity(
          code: error.response?.statusCode,
          message: "Something went wrong. Please try again later.",
        );
    }
  }

  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    if (Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
      headers['Authorization'] = 'Bearer ${UserStore.to.token}';
    }
    return headers;
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = !cacheEnable,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= <String, dynamic>{};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  /// restful put
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful patch
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful delete
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  Future postForm(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }
}

class ErrorEntity implements Exception {
  int? code = 0;
  String message = "";
  String? errorCode;
  ErrorEntity({
    required this.code,
    required this.message,
    this.errorCode,
  });

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, errorCode $errorCode, $message";
  }
}
