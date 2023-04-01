import 'package:flutter/material.dart';
import 'poli_page.dart';
import 'pegawai_detail.dart';
import 'pasien_detail.dart';
import '../model/pegawai.dart';
import '../model/pasien.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          GestureDetector(
            child: Card(
              child: ListTile(
                title: const Text('Data Poli'),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PoliPage(),
                  ));
            },
          ),
          GestureDetector(
            child: Card(
              child: ListTile(
                title: const Text('Pegawai'),
              ),
            ),
            onTap: () {
              Pegawai dataPegawai = new Pegawai(
                  nip: '324513425',
                  nama: 'Joko',
                  tanggal_lahir: '1 januari 2000',
                  nomor_telepon: '089123456',
                  email: 'j@j.com',
                  password: '1234');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PegawaiDetail(pegawai: dataPegawai)));
            },
          ),
          GestureDetector(
            child: Card(
              child: ListTile(
                title: const Text("Pasien"),
              ),
            ),
            onTap: () {
              Pasien datapasien = new Pasien(
                  nomor_rm: '121',
                  nama: 'anwar',
                  tanggal_lahir: '28 februari 2000',
                  nomor_telepon: '0986472525',
                  alamat: 'Surakarta');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PasienDetail(pasien: datapasien)));
            },
          )
        ],
      ),
    );
  }
}
