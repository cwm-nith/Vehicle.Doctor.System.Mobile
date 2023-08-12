class ErrorBase {
  final String? code;
  final String? message;

  ErrorBase({
    this.code,
    this.message,
  });

  factory ErrorBase.fromJson(Map<String, dynamic> json) => ErrorBase(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}

class ValidationModelError {
  final String? message;
  final List<Error>? errors;

  ValidationModelError({
    this.message,
    this.errors,
  });

  factory ValidationModelError.fromJson(Map<String, dynamic> json) =>
      ValidationModelError(
        message: json["message"],
        errors: json["errors"] == null
            ? []
            : List<Error>.from(
                json["errors"]!.map(
                  (x) => Error.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors == null
            ? []
            : List<dynamic>.from(
                errors!.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class Error {
  final String? field;
  final int? code;
  final String? message;

  Error({
    this.field,
    this.code,
    this.message,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        field: json["field"],
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "code": code,
        "message": message,
      };
}
