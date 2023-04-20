import 'package:flutter/material.dart';
import '../controller/form_user_controller.dart';
import 'package:appbatech_app/core.dart';
import 'package:get/get.dart';

class FormUserView extends StatelessWidget {
  const FormUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormUserController>(
      init: FormUserController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: Obx(
              () => Text(controller.formname.value),
            ),
          ),
          body: SingleChildScrollView(
            child: Obx(
              () => Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormField(
                      enabled: controller.edit.value ? false : true,
                      controller: controller.kduser,
                      decoration: InputDecoration(
                        filled: controller.edit.value ? true : false,
                        fillColor: controller.edit.value
                            ? Colors.grey.withOpacity(0.2)
                            : Colors.transparent,
                        labelText: "Kode User",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.username,
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      controller: controller.password,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.nama,
                      decoration: InputDecoration(
                        labelText: "Nama",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.hakAkses,
                      decoration: InputDecoration(
                        labelText: "Hak Akses",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.kdKlinik,
                      decoration: InputDecoration(
                        labelText: "Kode Kinik",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: controller.kdCabang,
                      decoration: InputDecoration(
                        labelText: "Kode Cabang",
                        labelStyle: const TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 65,
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                if (controller.edit.isFalse) {
                  controller.addUser();
                } else {
                  controller.updateUser();
                }
              },
              child: const Text("Save"),
            ),
          ),
        );
      },
    );
  }
}
