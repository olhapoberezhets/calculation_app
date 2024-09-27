import 'package:calculation_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function() onTap;
  final String text;

  const Button({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.blueAccent,
            width: 2.0,
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
