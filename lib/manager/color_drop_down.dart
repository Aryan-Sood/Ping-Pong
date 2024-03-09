import 'package:flutter/material.dart';

class ColorsDropDown extends StatefulWidget {
  const ColorsDropDown({super.key});

  @override
  State<ColorsDropDown> createState() => _ColorsDropDown();
}

class _ColorsDropDown extends State<ColorsDropDown> {
  List<String> dropDownItems = ['Red', 'Blue', 'Green', 'Orange'];

  String selectedItem = 'Red';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: selectedItem,
          onChanged: (String? newColor) {
            setState(() {
              selectedItem = newColor ?? selectedItem;
            });
          },
          items: dropDownItems.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
