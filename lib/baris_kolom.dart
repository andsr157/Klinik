import 'package:flutter/material.dart';

class ColumRowWidget extends StatelessWidget {
  const ColumRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Row"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var i = 1; i < 4; i++)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var j = 1; j < 4; j++)
                  Column(
                    children: [Text("Baris $i, Kolom $j")],
                  )
              ],
            ),
        ],
      ),
    );
  }
}
