import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:tes_api/controller/allmodel.dart';
import 'package:tes_api/model/modelfilm/modelfiml.dart';

class controllermodel extends GetxController {
  Future<List<Listfilm?>> api() async {
    
    Uri url = Uri.parse("http://192.168.100.70:3000/film");
    await Future.delayed(Duration(seconds: 3));
    try {
      var parse = await http.get(url);
      List<dynamic> jsondata =
          (jsonDecode(parse.body) as Map<String, dynamic>)['Listfilm'];
      print(parse.body);
      if (jsondata == null) {
        return [];
      } else {
        return jsondata.map((e) => Listfilm.fromJson(e)).toList();
      }
    } catch (e) {
      return [];
    }
  }
 Future<List<Listfilm?>> TitleAPI() async {
    
    Uri url = Uri.parse("http://192.168.100.70:3000/film/Title/populer");
    await Future.delayed(Duration(seconds: 3));
    try {
      var parse = await http.get(url);
      List<dynamic> jsondata =
          (jsonDecode(parse.body) as Map<String, dynamic>)['Listfilm'];
      print(parse.body);
      if (jsondata == null) {
        return [];
      } else {
        return jsondata.map((e) => Listfilm.fromJson(e)).toList();
      }
    } catch (e) {
      return [];
    }
  }

 Future<List<Listfilm?>> TitleAPItrending() async {
    
    Uri url = Uri.parse("http://192.168.100.70:3000/film/Title/trending");
    await Future.delayed(Duration(seconds: 3));
    try {
      var parse = await http.get(url);
      List<dynamic> jsondata =
          (jsonDecode(parse.body) as Map<String, dynamic>)['Listfilm'];
      print(parse.body);
      if (jsondata == null) {
        return [];
      } else {
        return jsondata.map((e) => Listfilm.fromJson(e)).toList();
      }
    } catch (e) {
      return [];
    }
  }
  
  Future<List<Mahasiswa>> apidetail(String id) async {
    Uri url = Uri.parse("http://192.168.1.14:3000/tampil/$id");

    var parse = await http.get(url);
    List<dynamic> jsondata =
        (jsonDecode(parse.body) as Map<String, dynamic>)['Mahasiswa'];
    print(parse.body);
    return jsondata.map((element) => Mahasiswa.fromJson(element)).toList();
  }


 Future<List<Listfilm?>> Genreaction() async {
    
    Uri url = Uri.parse("http://192.168.100.70:3000/film/Genre/action");
    await Future.delayed(Duration(seconds: 3));
    try {
      var parse = await http.get(url);
      List<dynamic> jsondata =
          (jsonDecode(parse.body) as Map<String, dynamic>)['Listfilm'];
      print(parse.body);
      if (jsondata == null) {
        return [];
      } else {
        return jsondata.map((e) => Listfilm.fromJson(e)).toList();
      }
    } catch (e) {
      return [];
    }
  } 
   Future<List<Listfilm?>> Genreadvanture() async {
    
    Uri url = Uri.parse("http://192.168.100.70:3000/film/Genre/advanture");
    await Future.delayed(Duration(seconds: 3));
    try {
      var parse = await http.get(url);
      List<dynamic> jsondata =
          (jsonDecode(parse.body) as Map<String, dynamic>)['Listfilm'];
      print(parse.body);
      if (jsondata == null) {
        return [];
      } else {
        return jsondata.map((e) => Listfilm.fromJson(e)).toList();
      }
    } catch (e) {
      return [];
    }
  } 
}
