import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:appbatech_app/core.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      init: UserController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("User"),
          ),
          body: SingleChildScrollView(
            child: Obx(() {
              return Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: controller.users,
                ),
              );
            }),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFFFFB901),
            onPressed: () async {
              await Get.to(const FormUserView());
              controller.getData();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
