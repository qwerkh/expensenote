import 'package:flutter/material.dart';
import 'src/app.dart';
import './utils/localization/initialize_i18n.dart' show initializeI18n;

void main() async {
  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(App(localizedValues: localizedValues));
}
