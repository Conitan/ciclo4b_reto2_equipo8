import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'ui/app.dart';
import 'ui/controllers/shopping_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  // TODO - Omar Yesid
  // agregar el ShoppingController al DI de Get
  Get.put(ShoppingController());
  runApp(const MyApp());
}
