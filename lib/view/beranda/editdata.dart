import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:tes_api/controller/authcontroller.dart';

class editdata extends StatefulWidget {
  const editdata({super.key});

  @override
  State<editdata> createState() => _editdataState();
}

class _editdataState extends State<editdata> {
  @override
  Widget build(BuildContext context) {
    TextEditingController dateController = TextEditingController();
    void selectDateTime(BuildContext context) {
      DatePicker.showDateTimePicker(
        context,
        showTitleActions: true,
        minTime: DateTime(2000),
        maxTime: DateTime(2101),
        onConfirm: (DateTime picked) {
          setState(() {
            dateController.text = picked.toString();
          });
        },
        currentTime: DateTime.now(),
      );
    }

    var selectedOption = ''.obs;
    var selectedOption1 = ''.obs;
    List<String> items = ['Sudah Selesai', 'Belum Selesai'];
    List<String> item = ['Sangat penting', 'Penting', 'Biasa saja'];
    final auth = Get.find<authcontroller>();
    final index = Get.arguments;
    final controller = Get.find<authcontroller>();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 21, 22, 31),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 21, 22, 31),
          leading: IconButton(
              onPressed: () => Get.back(), icon: Icon(Icons.arrow_back)),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: controller.getUserDocument(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              Map<String, dynamic> data = index.data() as Map<String, dynamic>;
              if (data.containsKey('id') &&
                  data.containsKey('prioritas') &&
                  data.containsKey('status') &&
                  data.containsKey('date') &&
                  data.containsKey('title')) {
                String id = data['id'];
                String prioritas = data['prioritas'];

                String status = data['status'];
                String date = data['date'];

                String title = data['title'];
                TextEditingController tes = TextEditingController(text: title);
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Container(
                        height: 253,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: tes,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: Colors.white),
                                focusColor: Colors.white,
                                fillColor: Colors.white,
                                border: InputBorder.none,
                                hintText: 'What do you want to do ?...',
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 66,
                      ),
                      Container(
                        height: 70,
                        width: 300,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "Batas Waktu",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () => selectDateTime(context),
                                child: Container(
                                  height: 80,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Color.fromARGB(255, 21, 22, 31),
                                  ),
                                  child: TextFormField(
                                    style: TextStyle(color: Colors.white),
                                    controller: dateController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      labelText: 'Pilih Tanggal',
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      suffixIcon: GestureDetector(
                                        onTap: () => selectDateTime(context),
                                        child: Icon(
                                          Icons.calendar_today,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            hint: const Text(
                              'Pilih Status',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: items.contains(selectedOption.value)
                                ? selectedOption.value
                                : null,
                            onChanged: (newValue) {
                              selectedOption.value = newValue!;
                            },
                            items: items.map((option) {
                              return DropdownMenuItem(
                                child: Text(
                                  option,
                                  style: TextStyle(color: Colors.green),
                                ),
                                value: option,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Obx(
                          () => DropdownButton(
                            isExpanded: true,
                            hint: const Text(
                              'Pilih Prioritas',
                              style: TextStyle(color: Colors.white),
                            ),
                            value: item.contains(selectedOption1.value)
                                ? selectedOption1.value
                                : null,
                            onChanged: (newValue) {
                              selectedOption1.value = newValue!;
                            },
                            items: item.map((option) {
                              return DropdownMenuItem(
                                child: Text(
                                  option,
                                  style: TextStyle(color: Colors.green),
                                ),
                                value: option,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.edit(
                                  tes.text,
                                  dateController.text,
                                  selectedOption.value,
                                  selectedOption1.value,
                                  id);
                              print("resssssssssss $id");
                              print(controller.edit(
                                  title, date, status, prioritas, id));
                            },
                            child: Container(
                              height: 50,
                              width: 114,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Color(0xffD9D9D9)),
                              child: Center(
                                child: Text(
                                  "Edit",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 50,
                            width: 114,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Color(0xffA75555)),
                            child: Center(
                              child: Text(
                                "Batal",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              }
              return SizedBox();
            }));
  }
}
