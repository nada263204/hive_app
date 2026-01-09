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
                // Open Hive Box Future must be awaited
                box = await Hive.openBox("test");
              },
              child: const Text("Open Box"),
            ),

            ElevatedButton(
              onPressed: () {
                box.addAll([123, 456, 789]);
              },
              child: const Text("Put Data"),
            ),
            ElevatedButton(
              onPressed: () {
                print(box.get(0));
                print(box.get(79));
                print(box.get(80));
                print(box.get(81));
                print(box.get(82));
                print(box.get(83));
              },
              child: const Text("Display Box"),
            ),
          ],
        ),
      ),
    );
  }
}
