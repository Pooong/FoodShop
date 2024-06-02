import 'package:find_food/core/ui/widgets/appbar/license_identify_appbar.dart';
import 'package:flutter/material.dart';

class ImagesIdentifyPage extends StatelessWidget {
  const ImagesIdentifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LicenseIdentifyAppbar(),
      body: buildImagesIdentifyBody(),
    );
  }
  
  buildImagesIdentifyBody() {}
}