// To parse this JSON data, do
//
//     final filmmodels = filmmodelsFromJson(jsonString);

import 'dart:convert';

Filmmodels filmmodelsFromJson(String str) => Filmmodels.fromJson(json.decode(str));

String filmmodelsToJson(Filmmodels data) => json.encode(data.toJson());

class Filmmodels {
    int status;
    List<Listfilm> listfilm;

    Filmmodels({
        required this.status,
        required this.listfilm,
    });

    factory Filmmodels.fromJson(Map<String, dynamic> json) => Filmmodels(
        status: json["status"],
        listfilm: List<Listfilm>.from(json["Listfilm"].map((x) => Listfilm.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "Listfilm": List<dynamic>.from(listfilm.map((x) => x.toJson())),
    };
}

class Listfilm {
    int idFilm;
    String jdlFilm;
    String ratingFilm;
    int tahunRilis;
    String sinopsis;
    String linkvideo;
    String durasiFilm;
    String image;
    int usiaminimal;
    String genre;
    String direct;
    String title;

    Listfilm({
        required this.idFilm,
        required this.jdlFilm,
        required this.ratingFilm,
        required this.tahunRilis,
        required this.sinopsis,
        required this.linkvideo,
        required this.durasiFilm,
        required this.image,
        required this.usiaminimal,
        required this.genre,
        required this.direct,
        required this.title,
    });

    factory Listfilm.fromJson(Map<String, dynamic> json) => Listfilm(
        idFilm: json["id_film"],
        jdlFilm: json["jdl_film"],
        ratingFilm: json["rating_film"],
        tahunRilis: json["tahun_rilis"],
        sinopsis: json["sinopsis"],
        linkvideo: json["linkvideo"],
        durasiFilm: json["durasi_film"],
        image: json["image"],
        usiaminimal: json["usiaminimal"],
        genre: json["Genre"],
        direct: json["Direct"],
        title: json["Title"],
    );

    Map<String, dynamic> toJson() => {
        "id_film": idFilm,
        "jdl_film": jdlFilm,
        "rating_film": ratingFilm,
        "tahun_rilis": tahunRilis,
        "sinopsis": sinopsis,
        "linkvideo": linkvideo,
        "durasi_film": durasiFilm,
        "image": image,
        "usiaminimal": usiaminimal,
        "Genre": genre,
        "Direct": direct,
        "Title": title,
    };
}
