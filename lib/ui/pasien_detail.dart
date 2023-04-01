import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Poli'),
      ),
      body: Column(children: [
        SizedBox(height: 20),
        Text(
          "Nip:${widget.pasien.nomor_rm}",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Nama:${widget.pasien.nama}",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Tanggal Lahir:${widget.pasien.tanggal_lahir}",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Nomor Telepon:${widget.pasien.nomor_telepon}",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "Email:${widget.pasien.alamat}",
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("Ubah")),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text("Hapus")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back")),
          ],
        )
      ]),
    );
  }
}
