import 'package:flutter/material.dart';

class SmallCards extends StatelessWidget {
  const SmallCards({
    Key? key,
    required this.icon,
    required this.color,

    ///Text color
    required this.text,
    required this.cardcolor,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color color;
  final Color cardcolor;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: Colors.black,
      color: cardcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: SizedBox(
        height: 8,
        width: 8,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 35,
                color: color,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: color,
                ),
                textAlign: TextAlign.center,
              ),
            ]),
      ),
    );
  }
}
