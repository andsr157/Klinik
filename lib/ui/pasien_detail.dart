import "package:flutter/material.dart";
import '../service/pasien_service.dart';
import 'pasien_page.dart';
import 'pasien_update_form.dart';
import '../model/pasien.dart';
import 'package:intl/intl.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;

  const PasienDetail({Key? key, required this.pasien}) : super(key: key);
  @override
  PasienDetailState createState() => PasienDetailState();
}

class PasienDetailState extends State<PasienDetail> {
  Stream<Pasien> getData() async* {
    Pasien data = await PasienService().getById(widget.pasien.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Pasien")),
      body: StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return const Text('Data Tidak Ditemukan');
          }
          return Column(
            children: [
              SizedBox(height: 20),
              Text(
                "Nip Pasien : ${snapshot.data.nomorRmPasien}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Nama Pasien : ${snapshot.data.namaPasien}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Tgl Lahir Pasien : ${DateFormat('yyyy-MM-dd').format(snapshot.data.lahirPasien!)}",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Nomor Telp Pasien : ${snapshot.data.nomorPasien}",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                "Email Pasien : ${snapshot.data.alamatPasien}",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_tombolUbah(), _tombolHapus()],
              )
            ],
          );
        },
      ),
    );
  }

  _tombolUbah() {
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PasienUpdateForm(pasien: snapshot.data)));
              },
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: const Text("Ubah"),
            ));
  }

  _tombolHapus() {
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            StreamBuilder(
                stream: getData(),
                builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                      onPressed: () async {
                        await PasienService()
                            .hapus(snapshot.data)
                            .then((value) {
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasienPage()));
                        });
                      },
                      child: const Text("YA"),
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                    )),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Tidak"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: const Text("Hapus"),
    );
  }
}
