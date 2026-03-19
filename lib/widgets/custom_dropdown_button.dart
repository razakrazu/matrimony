import 'package:flutter/material.dart';
import 'package:matrimony_app/core/colors.dart';

class CustomDropdownButton extends StatelessWidget {
  final String selectvalue;
  final List<String> items;
  final Function(String) onpressed;
  final String hintText;
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onpressed,
    required this.selectvalue,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,

      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: maroon,width: 1.5),
      ),
      child: Center(
        child: DropdownButtonFormField(
          value: selectvalue,
          hint: Text(hintText),
          isExpanded: true,
          // underline: const SizedBox(),
          icon: const Icon(Icons.keyboard_arrow_down),
        
          items: items.map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
            
        
          onChanged: (value) {
            if (value != null) {
              onpressed(value);
            }
          },
         decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
           errorBorder: InputBorder.none,
          
          ),
          
        ),
      ),
    );
  }
}
