import 'package:flutter/material.dart';
import 'package:getx_new_mvvm_architecture/product/enum/build_type.dart';

abstract final class AppConstants {
  static final paddingConstants = _PaddingConstants.instance;
  static final appBuildType = _AppBuildType.instance;
  static final appTheme = _AppTheme.instance;
  static final appUserEntityId = _AppUserEntityId.instance;
}

final class _AppBuildType {
  static _AppBuildType? _instance;
  static _AppBuildType get instance => _instance ??= _AppBuildType._();
  _AppBuildType._();

  final BuildType buildType = BuildType.release;
}

final class _AppUserEntityId {
  static _AppUserEntityId? _instance;
  static _AppUserEntityId get instance => _instance ??= _AppUserEntityId._();
  _AppUserEntityId._();

  final int appUserEntityId = 1;
}

final class _PaddingConstants {
  static _PaddingConstants? _instance;
  static _PaddingConstants get instance => _instance ??= _PaddingConstants._();
  _PaddingConstants._();

  final double pageHorizontalPadding = 16.0;
}

final class _AppTheme {
  static _AppTheme? _instance;
  static _AppTheme get instance => _instance ??= _AppTheme._();
  _AppTheme._();

  ThemeData get theme => ThemeData(useMaterial3: true);
}
