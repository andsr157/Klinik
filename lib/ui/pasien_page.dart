import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';
import 'pasien_item.dart';
import 'pasien_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PasienForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PasienItem(
              pasien: Pasien(
                  nomor_rm: '123',
                  nama: 'anto',
                  tanggal_lahir: '17 agustus 1945',
                  nomor_telepon: '09875334567',
                  alamat: 'mars')),
          PasienItem(
              pasien: Pasien(
                  nomor_rm: '124',
                  nama: 'manto',
                  tanggal_lahir: '19 januari 1945',
                  nomor_telepon: '0872345611',
                  alamat: 'venus')),
          PasienItem(
              pasien: Pasien(
                  nomor_rm: '125',
                  nama: 'rizki',
                  tanggal_lahir: '31 desember 1945',
                  nomor_telepon: '0853234511',
                  alamat: 'pluto')),
        ],
      ),
    );
  }
}
