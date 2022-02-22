import 'package:dice_roller/dice_page.dart';
import 'package:dice_roller/dnd_page.dart';
import 'package:dice_roller/flip_page.dart';
import 'package:dice_roller/rng_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DemoApp(), debugShowCheckedModeBanner: false);
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
      case 0: return 'Dice Roller';
      case 1: return 'D&D Dice Roller';
      case 2: return 'Flip Coin';
      case 3: return 'Random Number Generator';
      default: return 'Dice';
    }
  }

  Color _changeAppBarColor() {
    switch(_currentIndex) {
      case 0: return Colors.deepOrange;
      case 1: return Colors.purple;
      case 2: return const Color(0xffffd700);
      case 3: return Colors.pink;
      default: return Colors.deepOrange;
    }
  }

  IconData? _changeAppBarFAIcon() {
    switch(_currentIndex) {
      case 0: return FontAwesomeIcons.dice;
      case 1: return FontAwesomeIcons.diceD20;
      case 2: return FontAwesomeIcons.yinYang;
      case 3: return FontAwesomeIcons.robot;
      default: return FontAwesomeIcons.dice;
    }
  }



  @override
  void initState() {
    super.initState();
    _loadScreen();
    setState() {
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
    var diceColor = Colors.deepOrange;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _changeAppBarColor(),
        title: FittedBox(
          child: Text(_changeAppBarTitle(),
            style: GoogleFonts.exo2(
              textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.07,
                color: const Color(0xff202124),
              )
            ) ,
          ),
        ),
        leading: IconButton(
          icon: FaIcon(_changeAppBarFAIcon(),
            color: const Color(0xff202124),
            size: MediaQuery.of(context).size.width * 0.1,

          ),
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
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/icons/flipco.png',
            ),
            label: '',
            backgroundColor: const Color(0xffffd700),
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