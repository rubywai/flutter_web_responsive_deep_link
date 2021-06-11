
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Scren"),
      ),
      body: Text("This is Argument ${Get.parameters['id']}"),
    );
  }
}