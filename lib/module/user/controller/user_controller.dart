import 'package:appbatech_app/core.dart';
import 'package:appbatech_app/database/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserView? view;
  final users = RxList<Widget>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    users.value = [];
    DataBaseHelper.getAll("user").then((value) {
      if (value.isEmpty) {
        Get.snackbar(
          "Sorry",
          "You have no data",
          backgroundColor: Colors.white,
          colorText: Colors.red,
        );
      } else {
        users.value = [];
        for (var i = 0; i < value.length; i++) {
          users.add(
            Column(
              children: [
                ExpansionTile(
                  title: Text(
                    value[i]['nama'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  children: [
                    ListTile(
                      focusColor: Colors.transparent,
                      subtitle: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        columnWidths: const <int, TableColumnWidth>{
                          0: FractionColumnWidth(0.3),
                          1: FractionColumnWidth(0.05),
                          2: FractionColumnWidth(0.65),
                        },
                        children: [
                          TableRow(children: [
                            const SizedBox(
                              height: 20,
                              child: Text("kduser",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(height: 20, child: Text(":")),
                            SizedBox(
                                height: 20,
                                child: Text(value[i]['kduser'],
                                    textAlign: TextAlign.end)),
                          ]),
                          TableRow(children: [
                            const SizedBox(
                              height: 20,
                              child: Text("username",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(height: 20, child: Text(":")),
                            SizedBox(
                                height: 20,
                                child: Text(value[i]['username'],
                                    textAlign: TextAlign.end)),
                          ]),
                          TableRow(children: [
                            const SizedBox(
                              height: 20,
                              child: Text("Hak Akses",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(height: 20, child: Text(":")),
                            SizedBox(
                                height: 20,
                                child: Text(value[i]['hak_akses'],
                                    textAlign: TextAlign.end)),
                          ]),
                          TableRow(children: [
                            const SizedBox(
                              height: 20,
                              child: Text("Kode Klinik",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(height: 20, child: Text(":")),
                            SizedBox(
                                height: 20,
                                child: Text(value[i]['kdklinik'],
                                    textAlign: TextAlign.end)),
                          ]),
                          TableRow(children: [
                            const SizedBox(
                              height: 20,
                              child: Text("Kode Cabang ",
                                  style: TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(height: 20, child: Text(":")),
                            SizedBox(
                                height: 20,
                                child: Text(value[i]['kdcabang'],
                                    textAlign: TextAlign.end)),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              height: 40,
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Action ",
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                            const SizedBox(height: 20, child: Text(":")),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () async {
                                  await Get.to(const FormUserView(),
                                      arguments: value[i]['id']);
                                  getData();
                                },
                                child: const Text("Edit"),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              height: 40,
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Action ",
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                            const SizedBox(height: 20, child: Text(":")),
                            Container(
                              padding: const EdgeInsets.only(top: 5, bottom: 5),
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {
                                  deletedata(value[i]['id']);
                                },
                                child: const Text("Delete"),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
                const Divider()
              ],
            ),
          );
        }
      }
    });
  }

  deletedata(id) {
    DataBaseHelper.deleteWhere('user', 'id=?', id).then((value) => Get.snackbar(
          "Success",
          "Data user berhasil di hapus ",
          colorText: const Color(0xFFFFB901),
          backgroundColor: Colors.white,
        ));
    getData();
  }
}
