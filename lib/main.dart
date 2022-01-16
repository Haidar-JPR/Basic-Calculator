import 'package:calculator_app/const.dart';
import 'package:calculator_app/widgets/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NeuCalculator(),
    );
  }
}

class NeuCalculator extends StatefulWidget {
  const NeuCalculator({
    Key? key,
  }) : super(key: key);

  @override
  State<NeuCalculator> createState() => _NeuCalculatorState();
}

class _NeuCalculatorState extends State<NeuCalculator> {
  String _history = '';
  String _expression = '';

  void numClick(String number) {
    setState(() {
      _expression += number;
    });
  }

  void allClear(String number) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String number) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String number) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 20,
              ),
              width: double.infinity,
              height: 50,
              child: Text(
                _history,
                style: fontStyle.copyWith(
                  fontSize: 24,
                  color: Colors.amber,
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 20,
              ),
              width: double.infinity,
              child: Text(
                _expression,
                style: fontStyle.copyWith(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                ),
              ),
              alignment: Alignment.centerRight,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  number: 'AC',
                  fillColor: 0XFF04293A,
                  press: allClear,
                ),
                CalButton(
                  number: 'C',
                  fillColor: 0XFF04293A,
                  press: clear,
                ),
                CalButton(
                  number: '%',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF2D4263,
                  press: numClick,
                ),
                CalButton(
                  number: '/',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF2D4263,
                  press: numClick,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  number: '7',
                  press: numClick,
                ),
                CalButton(
                  number: '8',
                  press: numClick,
                ),
                CalButton(
                  number: '9',
                  press: numClick,
                ),
                CalButton(
                  number: '*',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF2D4263,
                  press: numClick,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  number: '4',
                  press: numClick,
                ),
                CalButton(
                  number: '5',
                  press: numClick,
                ),
                CalButton(
                  number: '6',
                  press: numClick,
                ),
                CalButton(
                  number: '-',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF2D4263,
                  press: numClick,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  number: '1',
                  press: numClick,
                ),
                CalButton(
                  number: '2',
                  press: numClick,
                ),
                CalButton(
                  number: '3',
                  press: numClick,
                ),
                CalButton(
                  number: '+',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF2D4263,
                  press: numClick,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalButton(
                  number: '00',
                  press: numClick,
                ),
                CalButton(
                  number: '0',
                  press: numClick,
                ),
                CalButton(
                  number: '.',
                  press: numClick,
                ),
                CalButton(
                  number: '=',
                  fillColor: 0XFFFFFFFF,
                  textColor: 0XFF2D4263,
                  press: evaluate,
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
