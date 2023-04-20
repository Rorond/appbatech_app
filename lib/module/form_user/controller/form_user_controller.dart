import 'package:appbatech_app/core.dart';
import 'package:appbatech_app/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormUserController extends GetxController {
  final co = Get.put(UserController());
  FormUserView? view;
  final formname = RxString("");
  final edit = RxBool(false);

  TextEditingController kduser = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController hakAkses = TextEditingController();
  TextEditingController kdKlinik = TextEditingController();
  TextEditingController kdCabang = TextEditingController();

  @override
  void onInit() {
    if (Get.arguments != null) {
      getData(Get.arguments);
      formname.value = "Update User";
      edit.value = true;
    } else {
      formname.value = "Add User";
      edit.value = false;
    }
    super.onInit();
  }

  getData(id) async {
    DataBaseHelper.getWhere("user", 'id=?', id).then((value) {
      if (value.isEmpty) {
        Get.snackbar(
          "Sorry",
          "You have no data",
          backgroundColor: Colors.white,
          colorText: Colors.red,
        );
      } else {
        for (var i = 0; i < value.length; i++) {
          kduser.text = value[i]['kduser'];
          username.text = value[i]['username'];
          password.text = value[i]['password'];
          nama.text = value[i]['nama'];
          hakAkses.text = value[i]['hak_akses'];
          kdKlinik.text = value[i]['kdklinik'];
          kdCabang.text = value[i]['kdcabang'];
        }
      }
    });
  }

  void addUser() {
    if (kduser.text.isEmpty ||
        username.text.isEmpty ||
        password.text.isEmpty ||
        nama.text.isEmpty ||
        hakAkses.text.isEmpty ||
        kdKlinik.text.isEmpty ||
        kdCabang.text.isEmpty) {
      Get.snackbar(
        "Sorry",
        "Data belum lengkap",
        colorText: const Color(0xFFFFB901),
        backgroundColor: Colors.white,
      );
      return;
    } else {
      var data = {
        "kduser": kduser.text,
        "username": username.text,
        "password": password.text,
        "nama": nama.text,
        "hak_akses": hakAkses.text,
        "kdklinik": kdKlinik.text,
        "kdcabang": kdCabang.text,
      };
      DataBaseHelper.insert("user", data).then((value) {
        if (value > 0) {
          Get.back();
          co.getData();
          Get.snackbar(
            "Success",
            "Data user berhasil disimpan ",
            colorText: const Color(0xFFFFB901),
            backgroundColor: Colors.white,
          );
        } else {
          Get.snackbar(
            "Sorry",
            "Data user gagal disimpan ",
            colorText: Colors.red,
            backgroundColor: Colors.white,
          );
        }
      });
    }
  }

  void updateUser() {
    if (kduser.text.isEmpty ||
        username.text.isEmpty ||
        password.text.isEmpty ||
        nama.text.isEmpty ||
        hakAkses.text.isEmpty ||
        kdKlinik.text.isEmpty ||
        kdCabang.text.isEmpty) {
      Get.snackbar(
        "Sorry",
        "Data belum lengkap",
        colorText: const Color(0xFFFFB901),
        backgroundColor: Colors.white,
      );
      return;
    } else {
      var data = {
        "kduser": kduser.text,
        "username": username.text,
        "password": password.text,
        "nama": nama.text,
        "hak_akses": hakAkses.text,
        "kdklinik": kdKlinik.text,
        "kdcabang": kdCabang.text,
      };
      DataBaseHelper.update("user", data, "kduser=?", kduser.text)
          .then((value) {
        if (value > 0) {
          Get.back();
          co.getData();
          Get.snackbar(
            "Success",
            "Data user berhasil di update ",
            colorText: const Color(0xFFFFB901),
            backgroundColor: Colors.white,
          );
        } else {
          Get.snackbar(
            "Sorry",
            "Data user gagal di update ",
            colorText: Colors.red,
            backgroundColor: Colors.white,
          );
        }
      });
    }
  }
}
