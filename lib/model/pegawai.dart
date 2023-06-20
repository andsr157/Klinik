class Pegawai {
  int? id;
  String nipPegawai;
  String namaPegawai;
  DateTime lahirPegawai;
  String nomorPegawai;
  String emailPegawai;

  Pegawai(
      {this.id,
      required this.nipPegawai,
      required this.namaPegawai,
      required this.lahirPegawai,
      required this.nomorPegawai,
      required this.emailPegawai});

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
      id: json["id"],
      nipPegawai: json["nip"],
      namaPegawai: json["nama"],
      lahirPegawai: DateTime.parse(json["tanggal_lahir"]),
      nomorPegawai: json["nomor_telepon"],
      emailPegawai: json["email"]);

  Map<String, dynamic> toJson() => {
        "nip": nipPegawai,
        "nama": namaPegawai,
        "tanggal_lahir": lahirPegawai.toIso8601String(),
        "nomor_telepon": nomorPegawai,
        "email": emailPegawai
      };
}
