import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './ZikeyWidgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';
  bool evaluated = false;

  void numClick(String text) {
    setState(() {
      if (evaluated) {
        _expression = '';
        evaluated = false;
      }
      _expression += text;
    });
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      evaluated = true;
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Zikey Calculator',
            style: GoogleFonts.norican(),
          ),
        ),
        backgroundColor: Color(0xff283637),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.only(right: 50),
              alignment: Alignment(1, 1),
              child: Text(
                _history,
                style: GoogleFonts.orbitron(
                    textStyle:
                        TextStyle(fontSize: 24, color: Color(0xFF545f61))),
              ),
            ),
            Container(
              padding:
                  EdgeInsets.only(bottom: 12, right: 50, left: 12, top: 12),
              alignment: Alignment(1, 1),
              child: Text(
                _expression,
                style: GoogleFonts.orbitron(
                    textStyle: TextStyle(fontSize: 48, color: Colors.white)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              decoration:  BoxDecoration(color: Colors.red),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: 'AC',
                        textSize: 20,
                        callback: allClear,
                        fillColor: Color.fromARGB(0xFF, 0x6c, 0x80, 0x7f),
                      ),
                      CalcButton(
                        text: 'C',
                        textSize: 20,
                        callback: clear,
                        fillColor: Color.fromARGB(0xFF, 0x6c, 0x80, 0x7f),
                      ),
                      CalcButton(
                        text: '%',
                        textSize: 20,
                        callback: numClick,
                        fillColor: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                        textColor: Color.fromARGB(0xFF, 0x65, 0xbd, 0xbc),
                      ),
                      CalcButton(
                        text: '/',
                        textSize: 20,
                        callback: numClick,
                        fillColor: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                        textColor: Color.fromARGB(0xFF, 0x65, 0xbd, 0xbc),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '7',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '8',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '9',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '*',
                        textSize: 20,
                        callback: numClick,
                        fillColor: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                        textColor: Color.fromARGB(0xFF, 0x65, 0xbd, 0xbc),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '4',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '5',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '6',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '-',
                        textSize: 20,
                        callback: numClick,
                        fillColor: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                        textColor: Color.fromARGB(0xFF, 0x65, 0xbd, 0xbc),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '1',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '2',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '3',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '+',
                        textSize: 20,
                        callback: numClick,
                        fillColor: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                        textColor: Color.fromARGB(0xFF, 0x65, 0xbd, 0xbc),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CalcButton(
                        text: '.',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '0',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '00',
                        textSize: 30,
                        callback: numClick,
                      ),
                      CalcButton(
                        text: '=',
                        textSize: 20,
                        callback: evaluate,
                        fillColor: Color.fromARGB(0xFF, 0xFF, 0xFF, 0xFF),
                        textColor: Color.fromARGB(0xFF, 0x65, 0xbd, 0xbc),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
