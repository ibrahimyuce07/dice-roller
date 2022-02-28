import 'package:d20/d20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:mccounting_text/mccounting_text.dart';

class DNDPage extends StatelessWidget {
  const DNDPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DNDPage());
  }
}

class DNDApp extends StatefulWidget {
  const DNDApp({Key? key}) : super(key: key);

  @override
  _DNDAppState createState() => _DNDAppState();
}

class _DNDAppState extends State<DNDApp> with TickerProviderStateMixin {

  final d20 = D20();
  int _roll = 0;

  @override
  Widget build(BuildContext context) {
    initState() {
      super.initState();
    }

    dispose() {
      super.dispose();
    }

    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Center(
                        child: Bounceable(
                          curve: Curves.ease,
                          scaleFactor: 0.2,
                          onTap: () {
                            setState(() {
                              _roll = d20.roll('d4');
                            });
                          },
                          child: Image.asset(
                            'images/d4.webp',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.orange,
                      child: Center(
                        child: Bounceable(
                          curve: Curves.ease,
                          scaleFactor: 0.2,
                          onTap: () {
                            setState(() {
                              _roll = d20.roll('d6');
                            });
                          },
                          child: Image.asset(
                            'images/d6.webp',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.yellow,
                      child: Center(
                        child: Bounceable(
                          curve: Curves.ease,
                          scaleFactor: 0.2,
                          onTap: () {
                            setState(() {
                              _roll = d20.roll('d8');
                            });
                          },
                          child: Image.asset(
                            'images/d8.webp',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.green,
                      child: Center(
                        child: Bounceable(
                          curve: Curves.ease,
                          scaleFactor: 0.2,
                          onTap: () {
                            setState(() {
                              _roll = d20.roll('d10');
                            });
                          },
                          child: Image.asset(
                            'images/d10.webp',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Bounceable(
                          curve: Curves.ease,
                          scaleFactor: 0.2,
                          onTap: () {
                            setState(() {
                              _roll = d20.roll('d12');
                            });
                          },
                          child: Image.asset(
                            'images/d12.webp',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.indigo,
                      child: Center(
                        child: Bounceable(
                          curve: Curves.ease,
                          scaleFactor: 0.2,
                          onTap: () {
                            setState(() {
                              _roll = d20.roll('d20');
                            });
                          },
                          child: Image.asset(
                            'images/d20.webp',
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: Colors.purple,
                    child: Center(
                        child: McCountingText(
                      begin: 0,
                      end: _roll.toDouble(),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.15,
                        color: Colors.white,

                        fontFamily: 'Ubuntu',
                        shadows: const [
                          Shadow(
                            blurRadius: 5.0,
                            color: Color(0xff202124),
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
