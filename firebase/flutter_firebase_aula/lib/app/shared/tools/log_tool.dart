import 'package:logger/logger.dart';

var log = Logger(
  printer: PrettyPrinter(
      colors: true,
      errorMethodCount: 1,
      printEmojis: true,
      printTime: true,
      lineLength: 80,
      methodCount: 0),
);
