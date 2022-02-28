import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:google_fonts/google_fonts.dart';

class DicePage extends StatelessWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: DiceApp(), debugShowCheckedModeBanner: false);
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  String url = 'images/dice6/white/outputs/sw-new.webp';
  Widget _pic1 = Image.asset(
    'images/dice6/white/outputs/sw-new.webp',
  );
  Widget _pic2 = Image.asset(
    'images/dice6/white/outputs/sw-new.webp',
  );
  var _dice1 = 0;
  var _dice2 = 0;

  _updateImgWidgetOne() async {
    _dice1 = Random().nextInt(6) + 1;
    final ByteData data =
        await rootBundle.load('images/dice6/white/outputs/newdice-$_dice1.gif');
    _pic1 = Image.memory(
      data.buffer.asUint8List(),
      scale: 1,
    );
  }

  _updateImgWidgetTwo() async {
    _dice2 = Random().nextInt(6) + 1;
    final ByteData data =
        await rootBundle.load('images/dice6/white/outputs/newdice-$_dice2.gif');
    _pic2 = Image.memory(
      data.buffer.asUint8List(),
      scale: 1,
    );
  }

  _updateImgs() async {
    setState(() {
      _updateImgWidgetOne();
      _updateImgWidgetTwo();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  backgroundColor: const Color(0xff202124),
        backgroundColor: Colors.white,
        body: Center(
          child: SizedBox.expand(
            child: FittedBox(
              child: Bounceable(
                curve: Curves.ease,
                scaleFactor: 0.2,
                onTap: () {
                  _updateImgs();
                  print(_dice1);
                  print(_dice2);
                },
                // splashColor: Colors.transparent,
                // hoverColor: Colors.transparent,
                // focusColor: Colors.transparent,
                // highlightColor: Colors.transparent,

                child: Container(
                  //color: const Color(0xff202124),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      _pic1,
                      _pic2,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: Text(
          '$_dice1 + $_dice2 = ${_dice1 + _dice2}',
          style: GoogleFonts.ubuntu(
            textStyle: Theme.of(context).textTheme.headline1,
            fontSize: MediaQuery.of(context).size.width * 0.1,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            color: Colors.black,
          ),
        ));
  }
}
