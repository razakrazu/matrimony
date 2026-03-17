import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class MainButtonWidget extends StatelessWidget {
  final String  text;
final Color  color;
final Callback  onTap;

 const  MainButtonWidget({
    super.key,required this.text, required this.color,required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color:  color,
          borderRadius: BorderRadius.circular(30),
        ),
        child:  Center(
          child: Text(
          text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}