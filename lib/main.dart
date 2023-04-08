import 'package:belajar_fluter/ui/pegawai_page.dart';
import 'package:flutter/material.dart';
import 'ui/poli_page.dart';
import 'ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Klinik',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
