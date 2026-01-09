import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  late Box box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                box = await Hive.openBox("test");
              },
              child: const Text("Open Box"),
            ),

            ElevatedButton(
              onPressed: () {
                box.putAll({
                  "name": "Mohamed",
                  9: true,
                  "age": 30,
                  0: false,
                  2: [9, 2, 6],
                });
              },
              child: const Text("Put Data"),
            ),

            ElevatedButton(
              onPressed: () {
                box.put(2, "test at method");
              },
              child: const Text("Put Method"),
            ),

            ElevatedButton(
              onPressed: () {
                print(box.get("name"));
                print(box.get(9));
                print(box.get("age"));
                print(box.get(0));
                print(box.get(2));
              },
              child: const Text("Display Box"),
            ),
          ],
        ),
      ),
    );
  }
}
