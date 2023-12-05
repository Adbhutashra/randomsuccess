import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:randomsuccessapp/successCountRepository.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? message;
  int? randomNo;

  void onTapWidget2() {
    setState(() {
      randomNo = Random().nextInt(60);
    });
    int currentSeconds = DateTime.now().second;

    if (randomNo == currentSeconds) {
      context.read<SuccessCountRepository>().incrementSuccessCount();
      setState(() {
        message = "Success";
      });
    } else {
      message = "Try again";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Success'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 350,
                color: message == "Success" ? Colors.green : Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        message ?? "Widget 1",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        context
                            .read<SuccessCountRepository>()
                            .successCount
                            .toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    onTapWidget2();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 180,
                      height: 300,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'Tap me',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 180,
                    height: 300,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        randomNo?.toString() ?? "0",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
