import 'dart:math';
import 'dart:typed_data';

import 'package:dice_roller/dice_page.dart';
import 'package:dice_roller/dnd_page.dart';
import 'package:dice_roller/flip_page.dart';
import 'package:dice_roller/rng_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DemoApp());
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  Widget _currentWidget = const Scaffold();
  var _currentIndex = 0;
  String url = 'images/flip-0.gif';
  List<String> coinFace = ['heads', 'tail'];


  String _changeAppBarTitle() {
    switch(_currentIndex) {
      case 0: return 'Dice';
      case 1: return 'DND';
      case 2: return 'Flip';
      case 3: return 'Random Number Generator';
      default: return 'Dice';
    }
  }

  Color _changeAppBarColor() {
    switch(_currentIndex) {
      case 0: return Colors.red;
      case 1: return Colors.green;
      case 2: return Colors.purple;
      case 3: return Colors.pink;
      default: return Colors.red;
    }
  }

  IconData? _changeAppBarIcon() {
    switch(_currentIndex) {
      case 0: return Icons.ac_unit;
      case 1: return Icons.work;
      case 2: return Icons.flip;
      case 3: return CupertinoIcons.textformat_123;
      default: return Icons.workspaces_filled;
    }
  }



  @override
  void initState() {
    super.initState();
    _loadScreen();
    setState() {
      print('refreshing');
    }
  }

  void _loadScreen() {
    switch(_currentIndex) {
      case 0: return setState(() => _currentWidget = DiceApp());
      case 1: return setState(() => _currentWidget = DNDApp());
      case 2: return setState(() => _currentWidget = FlipApp());
      case 3: return setState(() => _currentWidget = RNGApp());
    }
  }

  @override
  Widget build(BuildContext context) {
    var diceColor = Colors.red;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _changeAppBarColor(),
        title: Text(_changeAppBarTitle()),
        leading: IconButton(
          icon: Icon(_changeAppBarIcon()),
          onPressed: () {

          },
          iconSize: 30,
          splashColor: Colors.transparent,
          alignment: Alignment.center,
        ),
      ),
      body: _currentWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          _loadScreen();
        },
                   items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/icons/dice64.png',
            ),
            label: '',
            backgroundColor: diceColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icons/dndicon64.png'),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/icons/flipco.png',
            ),
            label: '',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/icons/raffle.png',
            ),
            label: '',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }






}