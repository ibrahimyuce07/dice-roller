import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Dice Roller'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  int _selectedIndex = 0;
  String url =
      'images/flip-0.gif';
  Widget _pic = CircularProgressIndicator();
  List<String> coinFace = ['heads', 'tail'];
  @override
  void initState() {
    super.initState();
    setState(){
      print('refreshing');
    }
  }



  _updateImgWidget() async {
    final ByteData data = await rootBundle.load('images/flip-${
            Random().nextInt(2)}.gif');
    setState(() {
      _pic = Image.memory(data.buffer.asUint8List(), scale: 0.5,);
    });
  }

  @override
  Widget build(BuildContext context) {
    var diceColor = Colors.red;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        backgroundColor: diceColor,
        leading: const Icon(Icons.games),
        title: Text(widget.title),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                enableFeedback: false,

          child: _pic,
          onTap: () {
            _updateImgWidget();
          },
            ),
                    ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/dice64.png',
            ),
            label: '',
            backgroundColor: diceColor,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/dndicon64.png'),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/flipco.png',
            ),
            label: '',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'images/raffle.png',
            ),
            label: '',
            backgroundColor: Colors.pink,
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
