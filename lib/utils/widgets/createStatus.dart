import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uas_sosmed/app/data/controller/auth_controller.dart';

createStatus({BuildContext? context, String? type, String? docId}) {
  final authCon = Get.find<AuthController>();

  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      margin: !context!.isPhone
          ? const EdgeInsets.only(right: 150, left: 150)
          : null,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Form(
        key: authCon.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                '$type Status',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Apa yang sedang kamu pikirkan?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                controller: authCon.statusController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Can not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ConstrainedBox(
                constraints:
                    BoxConstraints.tightFor(width: Get.width, height: 40),
                child: ElevatedButton(
                  onPressed: () {
                    authCon.sendStatus(
                      type: type,
                      status: authCon.statusController.text,
                      docId: docId,
                    );
                  },
                  child: Text(type!),
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ),
  );
}
