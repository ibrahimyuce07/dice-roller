import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlipPage extends StatelessWidget {
  const FlipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FlipApp());
  }
}

class FlipApp extends StatefulWidget {
  const FlipApp({Key? key}) : super(key: key);

  @override
  _FlipAppState createState() => _FlipAppState();
}

class _FlipAppState extends State<FlipApp> {
  String url = 'images/flip-0.gif';
  Widget _pic = Image.asset('images/coin-placeholder.webp');
  //AudioPlayer audioPlayer = AudioPlayer();
  List<String> coinFace = ['heads', 'tail'];

  //audio
  //late final AudioCache _audioCache;
  var nextInt = -1;
  _updateImgWidget() async {
    nextInt = Random().nextInt(2);
    final ByteData data =
        await rootBundle.load('images/flip-$nextInt.gif');
    setState(() {
      _pic = Image.memory(
        data.buffer.asUint8List(),
        scale: 1,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    // _audioCache = AudioCache(
    //   prefix: 'images/',
    //   fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    // );
    setState() {
    }
  }

  @override
  Widget build(BuildContext context) {
    //var diceColor = Colors.red;
    return Scaffold(
      body: Container(
        color: const Color(0xff202124),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              InkWell(
                child: _pic,
                onTap: _updateImgWidget,

                //on up swipe
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              //text if heads or tails
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 150, 8, 50),
                child: Text(
                  '${flipResult()}',
                  style: GoogleFonts.ubuntu(
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: 48,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  flipResult() {
    if (nextInt == 0) {
      return 'Heads !';
    } else if (nextInt == 1) {
      return 'Tails !';
    }
    else {
      return 'Flip Coin';
    }
  }
}
