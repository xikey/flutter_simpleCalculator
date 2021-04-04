import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color fillColor;
  final double textSize;
  final Function callback;

  const CalcButton(
      {Key key,
      this.text,
      this.textColor = Colors.white,
      this.fillColor,
      this.textSize = 20,
      this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () {
            callback(text);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) return fillColor;
                return fillColor; // Defer to the widget's default.
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3.0),
              ))

              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              ),

//
          child: Text(
            text,
            style: GoogleFonts.orbitron(
                textStyle: TextStyle(fontSize: textSize, color: textColor)),
          ),
        ),
      ),
    );
  }
}
