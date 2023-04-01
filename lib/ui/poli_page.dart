import 'package:belajar_fluter/model/pegawai.dart';
import 'package:belajar_fluter/ui/pegawai_detail.dart';
import "package:flutter/material.dart";
import 'poli_detail.dart';
import '../model/poli.dart';
import '../model/pegawai.dart';

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
      ),
      body: ListView(
        children: [
          GestureDetector(
              child: Card(
                child: ListTile(
                  title: const Text('Poli Anak'),
                ),
              ),
              onTap: () {
                Poli poliAnak = new Poli(namaPoli: 'July Dwi Saputra');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PoliDetail(poli: poliAnak)));
              }),
          Card(
            child: ListTile(
              title: const Text('Poli Kandungan'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Poli Gigi'),
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Poli THT'),
            ),
          ),
          GestureDetector(
            child: Card(
              child: ListTile(
                title: const Text('Pegawai'),
              ),
            ),
            onTap: () {
              Pegawai datapegawai = new Pegawai(
                  nip: '12210979',
                  nama: 'July',
                  tanggal_lahir: '2 JULI 2000',
                  nomor_telepon: '081233456789',
                  email: 'jul@jul.jul',
                  password: 'Lorog99');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PegawaiDetail(pegawai: datapegawai)));
            },
          ),
          GestureDetector(
            child: Card(
              child: ListTile(
                title: const Text('Pasien'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
