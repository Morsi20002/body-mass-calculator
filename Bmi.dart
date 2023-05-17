import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/loginscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double _height = 170.0;
  double _weight = 70.0;
  double _bmi = 0.0;
  String _status = '';

  void _calculateBMI() {
    setState(() {
      _bmi = _weight / ((_height / 100) * (_height / 100));

      if (_bmi < 18.5) {
        _status = 'Underweight';
      } else if (_bmi < 25.0) {
        _status = 'Normal';
      } else if (_bmi < 30.0) {
        _status = 'Overweight';
      } else {
        _status = 'Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromARGB(205, 0, 187, 212),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Image.asset(
              "lib/assets/fitness.png",
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListTile(
                leading: Icon(
                  Icons.outbound_sharp,
                  size: 40,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 11, 58, 96),
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150.0,
              width: 140.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.withOpacity(0.3),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'BMI',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      _bmi > 0.0 ? _bmi.toStringAsFixed(1) : '0.0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      _status.isNotEmpty ? _status : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.rulerVertical,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Height',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '${_height.round()} cm',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _height =
                                  _height > 100.0 ? _height - 1.0 : _height;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _height =
                                  _height < 220.0 ? _height + 1.0 : _height;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 30.0),
                Column(
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.weight,
                      color: Colors.white,
                      size: 40.0,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Weight',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      '${_weight.round()} kg',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _weight =
                                  _weight > 30.0 ? _weight - 1.0 : _weight;
                            });
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _weight =
                                  _weight < 150.0 ? _weight + 1.0 : _weight;
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }
}
