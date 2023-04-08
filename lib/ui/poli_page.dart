import 'package:belajar_fluter/model/pegawai.dart';
import 'package:belajar_fluter/ui/pegawai_detail.dart';
import "package:flutter/material.dart";
import 'poli_detail.dart';
import '../model/poli.dart';
import '../model/pegawai.dart';
import 'poli_item.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Poli'),
        actions: [
          GestureDetector(
            child: Padding(
                padding: EdgeInsets.all(16.0), child: const Icon(Icons.add)),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PoliForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PoliItem(
            poli: Poli(namaPoli: "Poli Anak"),
          ),
          PoliItem(
            poli: Poli(namaPoli: "Poli Kandungan"),
          ),
          PoliItem(
            poli: Poli(namaPoli: "Poli Gigi"),
          ),
          PoliItem(
            poli: Poli(namaPoli: "Poli THT"),
          ),
        ],
      ),
    );
  }
}
