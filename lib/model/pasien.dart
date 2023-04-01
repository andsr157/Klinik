class Pasien {
  int? id;
  String nomor_rm;
  String nama;
  String tanggal_lahir;
  String nomor_telepon;
  String alamat;

  Pasien(
      {this.id,
      required this.nomor_rm,
      required this.nama,
      required this.tanggal_lahir,
      required this.nomor_telepon,
      required this.alamat});
}
