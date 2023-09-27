import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tes_api/controller/allmodel.dart';
import 'package:tes_api/controller/controllermodel.dart';

class detail extends GetView<controllermodel> {
  @override
  Widget build(BuildContext context) {
    final Mahasiswa Index = Get.arguments;
    Get.put(controllermodel());
    return Scaffold(
      body: FutureBuilder<List<Mahasiswa>>(
        future: controller.apidetail(Index.idMahasiswa.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: ListTile(
              leading: Text("${Index.nama}"),
              title: Text(
                "${Index.jurusan}",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Text("${Index.nim}"),
            ),
          );
        },
      ),
    );
  }
}
