import 'package:vehicle_doctor_mobile/common/utils/print.dart';

class Logger {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => myPrint('** $text. isError: [$isError]'));
  }
}
