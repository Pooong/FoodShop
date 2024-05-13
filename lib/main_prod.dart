import 'package:find_food/app.dart';
import 'package:find_food/app_config.dart';
import 'package:flutter/widgets.dart';

import 'flavors.dart';

Future<void> main() async {
  await appConfig();
  F.appFlavor = Flavor.prod;
  runApp(const App());
}
