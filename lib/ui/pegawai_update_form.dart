import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import '../service/pegawai_service.dart';
import 'pegawai_detail.dart';
import 'package:intl/intl.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiUpdateForm({Key? key, required this.pegawai}) : super(key: key);
  _PegawaiUpdateFormState createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipPegawaiCtrl = TextEditingController();
  final _namaPegawaiCtrl = TextEditingController();
  final _lahirPegawaiCtrl = TextEditingController();
  final _nomorPegawaiCtrl = TextEditingController();
  final _emailPegawaiCtrl = TextEditingController();
  final _passwdPegawaiCtrl = TextEditingController();

  Future<Pegawai> getData() async {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    setState(() {
      if (data.nipPegawai != null) {
        _nipPegawaiCtrl.text = data.nipPegawai;
      }
      if (data.namaPegawai != null) {
        _namaPegawaiCtrl.text = data.namaPegawai;
      }

      if (data.lahirPegawai != null) {
        _lahirPegawaiCtrl.text = data.lahirPegawai.toString();
      }
      if (data.nomorPegawai != null) {
        _nomorPegawaiCtrl.text = data.nomorPegawai;
      }
      if (data.emailPegawai != null) {
        _emailPegawaiCtrl.text = data.emailPegawai;
      }
      if (data.passwdPegawai != null) {
        _passwdPegawaiCtrl.text = data.passwdPegawai;
      }
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Pegawai")),
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
            _lahirPegawaiCtrl.text = DateFormat.yMd().format(selectedDate);
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
        Pegawai pegawai = Pegawai(
            nipPegawai: _nipPegawaiCtrl.text,
            namaPegawai: _namaPegawaiCtrl.text,
            lahirPegawai: DateTime.parse(_lahirPegawaiCtrl.text),
            nomorPegawai: _nomorPegawaiCtrl.text,
            emailPegawai: _emailPegawaiCtrl.text,
            passwdPegawai: _passwdPegawaiCtrl.text);
        String id = widget.pegawai.id.toString();
        await PegawaiService().ubah(pegawai, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PegawaiDetail(pegawai: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
