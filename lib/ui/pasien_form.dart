import '../model/pasien.dart';
import 'pasien_detail.dart';
import 'package:flutter/material.dart';
import '../service/pasien_service.dart';
import 'package:intl/intl.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({Key? key}) : super(key: key);
  _PasienFormState createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _lahirPasienCtrl = TextEditingController();
  final _nomorPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNomorRmPasien(),
              const SizedBox(height: 20),
              _fieldNamaPasien(),
              const SizedBox(height: 20),
              _fieldLahirPasien(),
              const SizedBox(height: 20),
              _fieldNomorPasien(),
              const SizedBox(height: 20),
              _fieldAlamatPasien(),
              const SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNomorRmPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Rm"),
      controller: _nomorRmPasienCtrl,
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pasien"),
      controller: _namaPasienCtrl,
    );
  }

  _fieldLahirPasien() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tgl Lahir Pasien"),
      controller: _lahirPasienCtrl,
      readOnly: true,
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
          setState(() {
            _lahirPasienCtrl.text = formattedDate;
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harap pilih Tgl Lahir Pasien';
        }
        return null;
      },
    );
  }

  _fieldNomorPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telp Pasien"),
      controller: _nomorPasienCtrl,
    );
  }

  _fieldAlamatPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Alamat Pasien"),
      controller: _alamatPasienCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        String formattedDate = DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(_lahirPasienCtrl.text));

        Pasien pasien = Pasien(
            nomorRmPasien: _nomorRmPasienCtrl.text,
            namaPasien: _namaPasienCtrl.text,
            lahirPasien: DateTime.parse(formattedDate),
            nomorPasien: _nomorPasienCtrl.text,
            alamatPasien: _alamatPasienCtrl.text);

        await PasienService().simpan(pasien).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasienDetail(pasien: value),
            ),
          );
        });
      },
      child: const Text("Simpan"),
    );
  }
}
