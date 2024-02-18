import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future darkModeSwitcher(BuildContext context) async {
  setDarkModeSetting(
    context,
    (Theme.of(context).brightness == Brightness.dark ? false : true)
        ? ThemeMode.dark
        : ThemeMode.light,
  );
}
