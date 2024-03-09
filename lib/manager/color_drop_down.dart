import 'package:flutter/material.dart';
import 'package:ping_pong/providers/color_provider.dart';
import 'package:provider/provider.dart';

class ColorsDropDown extends StatefulWidget {
  const ColorsDropDown({super.key});

  @override
  State<ColorsDropDown> createState() => _ColorsDropDown();
}

class _ColorsDropDown extends State<ColorsDropDown> {
  List<String> dropDownItems = ['Red', 'Blue', 'Green', 'Orange'];

  @override
  Widget build(BuildContext context) {
    final colorProvider = Provider.of<ColorProvider>(context);
    String selectedItem = colorProvider.getColor();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<String>(
          value: selectedItem,
          onChanged: (String? newColor) {
            setState(() {
              selectedItem = newColor ?? selectedItem;
              colorProvider.setColor(newColor ?? 'Red');
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
