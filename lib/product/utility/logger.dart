import 'package:flutter/material.dart';

enum LogColors {
  black,
  red,
  green,
  yellow,
  blue,
  magenta,
  cyan,
  white,
}

abstract class Logger {
  static void logMsg({required String msg, LogColors color = LogColors.green}) {
    return switch (color) {
      LogColors.black => debugPrint('\x1B[30m$msg\x1B[0m'),
      LogColors.red => debugPrint('\x1B[31m$msg\x1B[0m'),
      LogColors.green => debugPrint('\x1B[32m$msg\x1B[0m'),
      LogColors.yellow => debugPrint('\x1B[33m$msg\x1B[0m'),
      LogColors.blue => debugPrint('\x1B[34m$msg\x1B[0m'),
      LogColors.magenta => debugPrint('\x1B[35m$msg\x1B[0m'),
      LogColors.cyan => debugPrint('\x1B[36m$msg\x1B[0m'),
      LogColors.white => debugPrint('\x1B[37m$msg\x1B[0m'),
    };
  }
}
