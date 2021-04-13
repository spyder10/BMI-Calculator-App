import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'mycard.dart';
import 'result.dart';
import 'dart:math';

const activeCardColor = Colors.purple;
const inactiveCardColor = Color(0xFFABA3F7);
const bottomContainerColor = Colors.pink;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;
  int height = 180;
  int weight = 80;
  int age = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleColor = activeCardColor;
                        femaleColor = inactiveCardColor;
                      });
                    },
                    child: MyCard(
                      colour: maleColor,
                      cardChild: IconWithText(
                        icon: FontAwesomeIcons.mars,
                        iconText: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        maleColor = inactiveCardColor;
                        femaleColor = activeCardColor;
                      });
                    },
                    child: MyCard(
                      colour: femaleColor,
                      cardChild: IconWithText(
                        icon: FontAwesomeIcons.venus,
                        iconText: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyCard(
              colour: activeCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Height',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Slider(
                    min: 120,
                    max: 220,
                    value: height.toDouble(),
                    activeColor: Colors.pink,
                    inactiveColor: Color(0XFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 40),
                        ),
                        SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 3),
                        Text(
                          age.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 40),
                        ),
                        SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: bottomContainerColor,
            ),
            child: TextButton(
              onPressed: () {
                double heightInMeters = height / 100;
                double result = weight / (heightInMeters * heightInMeters);
                double mod = pow(10.0, 2);
                result = (result * mod).round().toDouble() / mod;
                String interpretation;
                String status;
                if (result >= 25) {
                  interpretation = 'Overweight';
                } else if (result > 18.5) {
                  interpretation = 'Normal';
                } else {
                  interpretation = 'Underweight';
                }
                if (result >= 25) {
                  status =
                      'You have a higher than normal body weight. Try to exercise more.';
                } else if (result >= 18.5) {
                  status = 'You have a normal body weight. Good job!';
                } else {
                  status =
                      'You have a lower than normal body weight. You can eat a bit more.';
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      bmiResult: result.toString(),
                      resultText: interpretation,
                      interpretation: status,
                    ),
                  ),
                );
              },
              child: Center(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.purple[700],
    );
  }
}

class IconWithText extends StatelessWidget {
  IconWithText({@required this.icon, @required this.iconText});

  final icon;
  final String iconText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70,
          color: Colors.black,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          iconText,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }
}
