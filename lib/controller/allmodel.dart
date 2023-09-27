// To parse this JSON data, do
//
//     final resful = resfulFromJson(jsonString);

import 'dart:convert';

Resful resfulFromJson(String str) => Resful.fromJson(json.decode(str));

String resfulToJson(Resful data) => json.encode(data.toJson());

class Resful {
    int? status;
    Mahasiswa? mahasiswa;

    Resful({
         this.status,
         this.mahasiswa,
    });

    factory Resful.fromJson(Map<String, dynamic> json) => Resful(
        status: json["status"],
        mahasiswa: json['Mahasiswa'] != null ? Mahasiswa.fromJson(json["Mahasiswa"].map((x) => Mahasiswa.fromJson(x))): null,
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Mahasiswa": mahasiswa?.toJson(),
    };
}

class Mahasiswa {
    int? idMahasiswa;
    String? nama;
    String? nim;
    String? jurusan;

    Mahasiswa({
         this.idMahasiswa,
         this.nama,
         this.nim,
         this.jurusan,
    });

    factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
        idMahasiswa: json["id_mahasiswa"],
        nama: json["nama"],
        nim: json["nim"],
        jurusan: json["jurusan"],
    );

    Map<String, dynamic> toJson() => {
        "id_mahasiswa": idMahasiswa,
        "nama": nama,
        "nim": nim,
        "jurusan": jurusan,
    };
}
