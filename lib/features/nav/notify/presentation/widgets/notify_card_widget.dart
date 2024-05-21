import 'package:flutter/material.dart';
//import 'package:get/get.dart';

class NotifyCardWidget extends StatelessWidget {
  final DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String formattedDate = '${currentDate.day}/${currentDate.month}/${currentDate.year}';

    return Card(
      child: _buildCardNotify(
        context,
        img: Image.asset('assets/images/food_1.png'),
        title: 'Notification Title',
        subtitle: 'Notification Description',
        trailing: formattedDate,
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
