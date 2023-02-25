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
      elevation: 0,
      shadowColor: Colors.black,
      // surfaceTintColor: Colors.greenAccent,
      surfaceTintColor: const Color(0xFF030C10),
      color: cardcolor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment(0.9, -1.0),
            child: Icon(
              Icons.more_horiz,
              size: 35,
              fill: 1.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 70,
            left: 20,
            child: Icon(
              icon,
              size: 50,
              color: color,
              fill: 0.5,
            ),
          ),
          Positioned(
            // alignment: const Alignment(-0.8, 0.8),
            bottom: 20,
            left: 20.0,
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: color,
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment(0.8, 0.0),
          //   child: Icon
          // )
        ],
        // Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       Icon(
        //         icon,
        //         size: 35,
        //         color: color,
        //       ),
        //       Text(
        //         text,
        //         style: TextStyle(
        //           fontWeight: FontWeight.bold,
        //           fontSize: 16,
        //           color: color,
        //         ),
        //         textAlign: TextAlign.center,
        //       ),
        //     ]
      ),
    );
  }
}
