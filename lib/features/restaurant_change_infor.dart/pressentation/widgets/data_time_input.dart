import 'package:find_food/core/configs/app_colors.dart';
import 'package:find_food/core/ui/widgets/text/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeInput extends StatelessWidget {
  final Rx<TimeOfDay> _selectedTime = TimeOfDay.now().obs;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white10,
      leading: const Icon(Icons.timer),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(color: Colors.grey),
      ),
      title: const TextWidget(
        text: 'Select Time Online',
        color: AppColors.primary,
      ),
      subtitle: Obx(() {
        return Text('Selected Time: ${_selectedTime.value.format(context)}');
      }),
      onTap: () async {
        final selectedTime = await showTimePicker(
          context: context,
          initialTime: _selectedTime.value,
        );
        if (selectedTime != null) {
          _selectedTime.value = selectedTime;
        }
      },
    );
  }
}
