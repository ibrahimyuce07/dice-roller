import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mccounting_text/mccounting_text.dart';

class RNGPage extends StatelessWidget {
  const RNGPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RNGApp(), debugShowCheckedModeBanner: false );
  }
}

class RNGApp extends StatefulWidget {
  const RNGApp({Key? key}) : super(key: key);

  @override
  _RNGAppState createState() => _RNGAppState();
}

class _RNGAppState extends State<RNGApp> with TickerProviderStateMixin {
  var _generatedNumber = 0;
  var _minValue = 1;
  var _maxValue = 100;

  void _generateRandom() {
    setState(() {
      _generatedNumber = Random().nextInt(_maxValue - _minValue + 1) + _minValue;
    });
  }
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  // dispose()
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202124),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              //2 text fields
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 8, 75, 8),
                  child: TextField(
                    style:  TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03,),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _minValue = int.parse(value);
                    },
                    decoration: InputDecoration(
                      helperText: '$_minValue',
                      helperStyle: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02,  color: Colors.white24),
                      fillColor:  Colors.white70,
                      label:  const Text('Min:'),
                      hintText: '0',
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.fromLTRB(75, 8, 75, 8),
                  child: TextField(
                    style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    //_minValue
                    onChanged: (value) {
                      _maxValue = int.parse(value) < _minValue
                          ? _minValue + 1
                          : int.parse(value);
                    },
                    decoration: InputDecoration(
                      fillColor:  Colors.white70,
                      label: Text('Max:', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03, ),),
                      hintText: '100',
                      filled: true,
                      helperText: '$_maxValue',
                      helperStyle: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.02, color: Colors.white24),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    _generateRandom();
                  },
                  child: FittedBox(
                    child: McCountingText(
                      begin: _minValue.toDouble(),
                      end: _generatedNumber.toDouble(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.17,
                        color: Colors.white70,
                        fontFamily: 'Ubuntu',
                        shadows: const [
                          Shadow(
                            blurRadius: 15.0,
                            color: Color(0xff202124),
                            offset: Offset(3.0, 3.0),
                          ),
                        ],
                      ),
                      duration: const Duration(seconds: 1),
                      curve: Curves.decelerate,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
