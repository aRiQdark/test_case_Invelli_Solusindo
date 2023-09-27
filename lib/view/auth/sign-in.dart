import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:tes_api/controller/authcontroller.dart';

class Registrasi extends GetView<authcontroller> {
  Registrasi({super.key});
  // final display = Get.find<Profilecustomer>();
final alamat = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final nohp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 100,),
              Text('Lets Get Started',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              Text('signup and we will continue',style: TextStyle(color: Colors.grey[500],fontWeight: FontWeight.w300),),
             
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 70,
                  width: 227,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: emailC,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ),
               
                  
               
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 70,
                    width: 227,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordC,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
    //             Container(
    //   padding: EdgeInsets.symmetric(horizontal: 16.0),
    //   child: Obx(
    //     () => DropdownButton(
    //       isExpanded: true,
    //       hint: Text('Pilih opsi'),
    //       value: controller.selectedOption.value,
    //       onChanged: (newValue) {
    //         controller.selectedOption.value = newValue!;
    //       },
    //       items: controller.options.map((option) {
    //         return DropdownMenuItem(
    //           child: Text(option),
    //           value: option,
    //         );
    //       }).toList(),
    //     ),
    //   ),
    // ),
                ElevatedButton(
                    onPressed: () => controller.signup(emailC.text, passwordC.text),
                    child: const Text('Daftar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
