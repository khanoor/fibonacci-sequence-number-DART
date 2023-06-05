import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController input = TextEditingController();
  List output = [];
  void main() {
    List<int> num = [0];

    for (int i = 0; i <= int.parse(input.text); i++) {
      if (i < 1) {
        num.add(num[i] + 1);
      }
      if (i > 1) {
        num.add(num[i - 1] + num[i - 2]);
      }
      print('$i: ${num[i]}');
      output.add('$i: ${num[i]}');
    }
    input.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  controller: input,
                  decoration: InputDecoration(),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        main();
                      });
                    },
                    child: Text("fibonacci Number")),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: ((context, index) {
                      return Text(
                        "$output",
                        style: TextStyle(fontSize: 20),
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
