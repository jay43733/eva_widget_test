import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatelessWidget {
  final double width;
  final String hintText;
  final List<String> menuEntry;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  const CustomDropdownMenu(
      {super.key,
      required this.width,
      required this.hintText,
      required this.menuEntry,
      this.selectedValue,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      requestFocusOnTap: false,
      width: width,
      hintText: hintText,
      onSelected: onChanged,
      dropdownMenuEntries: menuEntry.map((item) {
        return DropdownMenuEntry(value: item, label: item);
      }).toList(),
    );
  }
}
