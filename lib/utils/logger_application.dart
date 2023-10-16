import 'package:logger/logger.dart';

import 'logger_helper.dart';

class ApplicationLogger {
  static Logger getLogger(String className) => Logger(
        printer: PrefixPrinter(
          ApplicationLogPrinter(
            className: className,
            colors: true,
          ),
        ),
      );
}
