import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  late Box box;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hive Test")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// OPEN BOX
            ElevatedButton(
              onPressed: () async {
                box = await Hive.openBox("test");
                print("Box Opened");
              },
              child: const Text("Open Box"),
            ),

            /// PUT DATA
            ElevatedButton(
              onPressed: () {
                box.putAll({
                  "name": "Nada",
                  "age": 24,
                  1: true,
                  2: [1, 2, 3],
                });
                print("Data Inserted");
              },
              child: const Text("Put Data"),
            ),

            /// DISPLAY ALL
            ElevatedButton(
              onPressed: () {
                for (var key in box.keys) {
                  print("key: $key , value: ${box.get(key)}");
                }
              },
              child: const Text("Display All"),
            ),

            const Divider(),

            /// DELETE BY KEY
            ElevatedButton(
              onPressed: () {
                box.delete("name");
                print("Deleted key: name");
              },
              child: const Text("Delete by Key"),
            ),

            /// DELETE MULTIPLE KEYS
            ElevatedButton(
              onPressed: () {
                box.deleteAll(["age", 1]);
                print("Deleted multiple keys");
              },
              child: const Text("Delete Multiple Keys"),
            ),

            /// DELETE BY INDEX
            ElevatedButton(
              onPressed: () {
                if (box.length > 0) {
                  box.deleteAt(0);
                  print("Deleted at index 0");
                }
              },
              child: const Text("Delete At Index"),
            ),

            /// DELETE MULTIPLE INDEXES
            ElevatedButton(
              onPressed: () {
                if (box.length > 1) {
                  box.deleteAll([0, 1]);
                  print("Deleted at indexes 0 & 1");
                }
              },
              child: const Text("Delete Multiple Indexes"),
            ),

            const Divider(),

            /// CLEAR BOX
            ElevatedButton(
              onPressed: () async {
                await box.clear();
                print("Box Cleared");
              },
              child: const Text("Clear Box"),
            ),

            /// CLOSE BOX
            ElevatedButton(
              onPressed: () async {
                await box.close();
                print("Box Closed");
              },
              child: const Text("Close Box"),
            ),

            /// DELETE BOX FROM DISK
            ElevatedButton(
              onPressed: () async {
                await Hive.deleteBoxFromDisk("test");
                print("Box Deleted From Disk");
              },
              child: const Text("Delete Box From Disk"),
            ),
          ],
        ),
      ),
    );
  }
}
