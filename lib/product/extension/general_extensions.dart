import 'package:intl/intl.dart';

extension ListExtension on List? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullAndEmpty => this != null && this!.isNotEmpty;
}

extension MapExtension on Map? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullAndEmpty => this != null && this!.isNotEmpty;
}

extension SetExtension on Set? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullAndEmpty => this != null && this!.isNotEmpty;
}

extension DateTimeExtension on DateTime {
  String get toddMMyyyyHHmm => DateFormat("dd.MM.yyyy HH:mm").format(this);
}
