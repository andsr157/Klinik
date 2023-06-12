import 'dart:convert';

List<PoliItemm> PoliItemmFromJson(String str) =>
    List<PoliItemm>.from(json.decode(str).map((x) => PoliItemm.fromJson(x)));

String PoliItemmToJson(List<PoliItemm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PoliItemm {
  final int id;
  final String namaPoli;

  PoliItemm({required this.id, required this.namaPoli});

  factory PoliItemm.fromJson(Map<String, dynamic> json) =>
      PoliItemm(id: json['id'], namaPoli: json['nama_poli']);

  Map<String, dynamic> toJson() => {'nama_poli': namaPoli};
}
