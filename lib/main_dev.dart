import 'package:find_food/app.dart';
import 'package:find_food/app_config.dart';
import 'package:flutter/material.dart';

import 'flavors.dart';

Future<void> main() async {
  await appConfig();
  F.appFlavor = Flavor.dev;
  runApp(const App());
}
