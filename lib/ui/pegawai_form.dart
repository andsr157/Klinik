import '../model/pegawai.dart';
import 'pegawai_detail.dart';
import 'package:flutter/material.dart';
import '../service/pegawai_service.dart';
import 'package:intl/intl.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({Key? key}) : super(key: key);
  _PegawaiFormState createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _lahirPegawaiCtrl = TextEditingController();
  final _nomorPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwdPegawaiCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNipPegawai(),
              const SizedBox(height: 20),
              _fieldNamaPegawai(),
              const SizedBox(height: 20),
              _fieldLahirPegawai(),
              const SizedBox(height: 20),
              _fieldNomorPegawai(),
              const SizedBox(height: 20),
              _fieldEmailPegawai(),
              const SizedBox(height: 20),
              _fieldPasswdPegawai(),
              const SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNipPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nip Pegawai"),
      controller: _nipPegawaiCtrl,
    );
  }

  _fieldNamaPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Pegawai"),
      controller: _namaPegawaiCtrl,
    );
  }

  _fieldLahirPegawai() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tgl Lahir Pegawai"),
      controller: _lahirPegawaiCtrl,
      readOnly: true,
      onTap: () async {
        DateTime? selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (selectedDate != null) {
          setState(() {
            _lahirPegawaiCtrl.text =
                DateFormat('yyyy-MM-dd').format(selectedDate);
          });
        }
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harap pilih Tgl Lahir Pegawai';
        }
        return null;
      },
    );
  }

  _fieldNomorPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nomor Telp Pegawai"),
      controller: _nomorPegawaiCtrl,
    );
  }

  _fieldEmailPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Email Pegawai"),
      controller: _emailPegawaiCtrl,
    );
  }

  _fieldPasswdPegawai() {
    return TextField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwdPegawaiCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        String formattedDate = DateFormat('yyyy-MM-dd')
            .format(DateTime.parse(_lahirPegawaiCtrl.text));

        Pegawai pegawai = Pegawai(
            nipPegawai: _nipPegawaiCtrl.text,
            namaPegawai: _namaPegawaiCtrl.text,
            lahirPegawai: DateTime.parse(formattedDate),
            nomorPegawai: _nomorPegawaiCtrl.text,
            emailPegawai: _emailPegawaiCtrl.text);

        await PegawaiService().simpan(pegawai).then((value) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: value),
            ),
          );
        });
      },
      child: const Text("Simpan"),
    );
  }
}
