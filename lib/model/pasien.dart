class Pasien {
  int? id;
  String namaPasien;

  Pasien({this.id, required this.namaPasien});

  factory Pasien.fromJson(Map<String, dynamic> json) =>
      Pasien(id: json["id"], namaPasien: json["nama_pasien"]);

  Map<String, dynamic> toJson() => {"nama_pasien": namaPasien};
}
