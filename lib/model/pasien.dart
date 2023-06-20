class Pasien {
  int? id;
  String nomorRmPasien;
  String namaPasien;
  DateTime lahirPasien;
  String nomorPasien;
  String alamatPasien;

  Pasien(
      {this.id,
      required this.nomorRmPasien,
      required this.namaPasien,
      required this.lahirPasien,
      required this.nomorPasien,
      required this.alamatPasien});

  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
      id: json["id"],
      nomorRmPasien: json["nomor_rm"],
      namaPasien: json["nama"],
      lahirPasien: DateTime.parse(json["tanggal_lahir"]),
      nomorPasien: json["nomor_telepon"],
      alamatPasien: json["alamat"]);

  Map<String, dynamic> toJson() => {
        "nomor_rm": nomorRmPasien,
        "nama": namaPasien,
        "tanggal_lahir": lahirPasien.toIso8601String(),
        "nomor_telepon": nomorPasien,
        "alamat": alamatPasien
      };
}
