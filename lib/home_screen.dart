import 'package:calculator/components/my_button.dart';
import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          answer.toString(),
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(children: [
                        MYButton(
                          onPress: () {
                            userInput = ' ';
                            answer = ' ';
                            setState(() {});
                          },
                          title: 'AC',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                          title: '+/-',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                          title: '%',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                          title: '/',
                          color: Color(0xffffa00a),
                        ),
                      ]),
                      Row(children: [
                        MYButton(
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                          title: '7',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                          title: '8',
                        ),
                        MYButton(
                            onPress: () {
                              userInput += '0';
                              setState(() {});
                            },
                            title: '0'),
                        MYButton(
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                          title: 'x',
                          color: Color(0xffffa00a),
                        ),
                      ]),
                      Row(children: [
                        MYButton(
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                          title: '4',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                          title: '5',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                          title: '6',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                          title: '-',
                          color: Color(0xffffa00a),
                        ),
                      ]),
                      Row(children: [
                        MYButton(
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                          title: '1',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                          title: '2',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                          title: '3',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                          title: '+',
                          color: Color(0xffffa00a),
                        ),
                      ]),
                      Row(children: [
                        MYButton(
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                          title: '0',
                        ),
                        MYButton(
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                          title: '.',
                        ),
                        MYButton(
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                          title: 'DEL',
                        ),
                        MYButton(
                          onPress: () {
                            equalPress();
                            setState(() {});
                          },
                          title: '=',
                          color: Color(0xffffa00a),
                        ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
