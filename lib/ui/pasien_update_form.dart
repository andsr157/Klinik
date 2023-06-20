import 'package:flutter/material.dart';
import '../model/pasien.dart';
import '../service/pasien_service.dart';
import 'pasien_detail.dart';
import 'package:intl/intl.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;
  const PasienUpdateForm({Key? key, required this.pasien}) : super(key: key);
  _PasienUpdateFormState createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomorRmPasienCtrl = TextEditingController();
  final _namaPasienCtrl = TextEditingController();
  final _lahirPasienCtrl = TextEditingController();
  final _nomorPasienCtrl = TextEditingController();
  final _alamatPasienCtrl = TextEditingController();

  Future<Pasien> getData() async {
    Pasien data = await PasienService().getById(widget.pasien.id.toString());
    setState(() {
      if (data.nomorRmPasien != null) {
        _nomorRmPasienCtrl.text = data.nomorRmPasien;
      }
      if (data.namaPasien != null) {
        _namaPasienCtrl.text = data.namaPasien;
      }

      if (data.lahirPasien != null) {
        String formattedDate =
            DateFormat('yyyy-MM-dd').format(data.lahirPasien);
        _lahirPasienCtrl.text = formattedDate;
      }
      if (data.nomorPasien != null) {
        _nomorPasienCtrl.text = data.nomorPasien;
      }
      if (data.alamatPasien != null) {
        _alamatPasienCtrl.text = data.alamatPasien;
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
      appBar: AppBar(title: const Text("Ubah Pasien")),
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
      decoration: const InputDecoration(labelText: "Nomor Rm pasien"),
      controller: _nomorRmPasienCtrl,
    );
  }

  _fieldNamaPasien() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama pasien"),
      controller: _namaPasienCtrl,
    );
  }

  // Import library untuk DateFormat

  _fieldLahirPasien() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tgl Lahir pasien"),
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
            _lahirPasienCtrl.text = formattedDate.substring(0, 10);
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
        Pasien pasien = Pasien(
            nomorRmPasien: _nomorRmPasienCtrl.text,
            namaPasien: _namaPasienCtrl.text,
            lahirPasien: DateTime.parse(_lahirPasienCtrl.text),
            nomorPasien: _nomorPasienCtrl.text,
            alamatPasien: _alamatPasienCtrl.text);
        String id = widget.pasien.id.toString();
        await PasienService().ubah(pasien, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PasienDetail(pasien: value),
            ),
          );
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
