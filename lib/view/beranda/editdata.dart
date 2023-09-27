import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:tes_api/controller/authcontroller.dart';

class editdata extends StatefulWidget {
  const editdata({super.key});

  @override
  State<editdata> createState() => _editdata();
}

class _editdata extends State<editdata> {
  
  final api = Get.find<authcontroller>();
  TextEditingController dateController = TextEditingController();
  TextEditingController title = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    var selectedOption = ''.obs;
     var selectedOption1 = ''.obs;
    List<String> items = ['Sudah Selesai','Belum Selesai'];
     List<String> item = ['Sangat penting', 'Penting','Biasa saja'];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 22, 31),
      body: Padding(
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
                  controller: title,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      focusColor: Colors.white,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Susun Kegiatan kamu?...',

                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SizedBox(
              height: 66,
            ),
            Container(
              height: 80,
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
                    Container(
                      height: 80,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xffD9D9D9),
                      ),
                      child: TextFormField(
                        controller: dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: 'Pilih Tanggal',
                          suffixIcon: GestureDetector(
                            onTap: () => selectDateTime(context),
                            child: Icon(Icons.calendar_today),
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
                  hint: const Text('Pilih Status',style: TextStyle(color: Colors.white),),
                  
                  value: items.contains(selectedOption.value)
                      ? selectedOption.value
                      : null,
                  onChanged: (newValue) {
                    selectedOption.value = newValue!;
                  },
                  items: items.map((option) {
                    return DropdownMenuItem(
                    
                      child: Text(option,style: TextStyle(color: Colors.green),),
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
                  hint: const Text('Pilih Prioritas',style: TextStyle(color: Colors.white),),
                  
                  value: item.contains(selectedOption1.value)
                      ? selectedOption1.value
                      : null,
                  onChanged: (newValue) {
                    selectedOption1.value = newValue!;
                  },
                  items: item.map((option) {
                    return DropdownMenuItem(
                    
                      child: Text(option,style: TextStyle(color: Colors.green),),
                      value: option,
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => api.edit(title.text, dateController.text, selectedOption.value, selectedOption1.value),
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
      ),
    );
  }
}
