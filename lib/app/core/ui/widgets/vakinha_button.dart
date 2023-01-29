// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class VakinhaButton extends StatelessWidget {
  final String label;
  final double? width;
  final double heigth;
  final Color? color;
  final VoidCallback? onpressed;

  const VakinhaButton({
    Key? key,
    required this.label,
    this.width,
    this.heigth = 50,
    required this.onpressed,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: heigth,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: color,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
