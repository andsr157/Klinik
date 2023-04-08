import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';
import 'pegawai_item.dart';
import 'pegawai_form.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PegawaiForm()));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          PegawaiItem(
              pegawai: Pegawai(
                  nip: '12',
                  nama: 'anto',
                  tanggal_lahir: '12 oktober  2022',
                  nomor_telepon: '0895456721',
                  email: 'adada',
                  password: 'adadadad')),
          PegawaiItem(
              pegawai: Pegawai(
                  nip: '12',
                  nama: 'july',
                  tanggal_lahir: '12 oktober  2022',
                  nomor_telepon: '0895456721',
                  email: 'adada',
                  password: 'adadadad')),
          PegawaiItem(
              pegawai: Pegawai(
                  nip: '12',
                  nama: 'erpun',
                  tanggal_lahir: '12 oktober  2022',
                  nomor_telepon: '0895456721',
                  email: 'adada',
                  password: 'adadadad')),
        ],
      ),
    );
  }
}
