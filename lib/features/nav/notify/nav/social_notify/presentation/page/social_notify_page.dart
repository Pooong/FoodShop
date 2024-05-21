import 'package:find_food/features/nav/notify/nav/social_notify/presentation/controller/social_notify_controller.dart';
import 'package:find_food/features/nav/notify/presentation/widgets/notify_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialNotifyPage extends GetView<SocialNotifyController> {
  SocialNotifyPage({super.key});
  final DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = '${currentDate.day}/${currentDate.month}/${currentDate.year}';
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              _buildCardNotify(
                context,
                img: Image.asset('assets/images/food_1.png'),
                title: 'Notification Title',
                subtitle: 'Notification Description',
                trailing: formattedDate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildCardNotify(BuildContext context,
    {required Image img,
    required String title,
    required String subtitle,
    required String trailing, 
    }) {
  return ListTile(
    leading: img,
    title: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
    subtitle: Text(
      subtitle,
      style: Theme.of(context).textTheme.bodySmall,
    ),
    trailing: Text(trailing),
  );
}
