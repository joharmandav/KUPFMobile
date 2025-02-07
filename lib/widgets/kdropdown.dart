import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KDropDown extends StatelessWidget {
  final String title;
  final List<String> dropdown;
  final String? labelText;
  final RxnString value;
  final Function(String?)? onChange;

  const KDropDown({
    Key? key,
    required this.title,
    required this.dropdown,
    this.labelText,
    this.onChange,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => DropdownButtonFormField<String>(
        value: value.value,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        onChanged: onChange ??
                (String? newValue) {
              value(newValue ?? 'Select');
            },
        items: dropdown.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
