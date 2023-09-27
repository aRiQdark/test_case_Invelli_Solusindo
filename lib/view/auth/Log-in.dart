import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:tes_api/controller/authcontroller.dart';
import 'package:tes_api/primary_textfield.dart';
import 'package:tes_api/view/auth/sign-in.dart';
import 'package:tes_api/view/beranda/tesmain.dart';

class Login extends GetView<authcontroller> {
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 21, 22, 31),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 34, right: 34),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                Text(
                  "HI",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Please sign in to your account!",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Test TO DO List!",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(
                  height: 81,
                ),
                Container(
                  height: 60,
                  width: 292,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff262A34)),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      controller: emailC,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 60,
                  width: 292,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(0xff262A34)),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Obx(
                        () => PrimaryTextfield(
                        
                          hintText: 'Password',
                          
                          controller: passwordC,
                          obscureText:
                              controller.passwordIsHidden.value == true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          prefixIcon: Icon(Icons.lock,color: Colors.white,),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.passwordIsHidden.toggle();
                            },
                            icon: controller.passwordIsHidden.value == true
                                ? const Icon(Icons.visibility_outlined,color: Colors.white,)
                                : const Icon(Icons.visibility_off_outlined,color: Colors.white,),
                          ),
                        ),
                      )),
                  ),
                
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 170),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color(0xff545F71)),
                  ),
                ),
                SizedBox(
                  height: 108,
                ),
                InkWell(
                  onTap: () => controller.login(emailC.text, passwordC.text),
                  child: Container(
                    height: 60,
                    width: 239,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0xff5468FF)),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have Account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () => Get.to(Registrasi()),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
