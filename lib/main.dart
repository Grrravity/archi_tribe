import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/Routes/routes_export.dart';
import 'Core/Services/connectivity_checker.dart';
import 'Core/Theme/theme.dart';
import 'Data/DataSource/Remote/todo_client.dart';

void main() async {
  await initServices();
  runApp(const ArchiApp());
}

class ArchiApp extends StatelessWidget {
  const ArchiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Archi App",
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      //TODO Routes :)
      initialRoute: Routes.initialRoute,
      getPages: Nav.routes,
      //TODO theme
      themeMode: ThemeMode.system,
      defaultTransition: Transition.noTransition,
      theme: myTheme,
      darkTheme: myDarktheme,
    );
  }
}

Future<void> initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO Ajout dans les bindings de GetX
  Get.put<ConnectivityChecker>(ConnectivityChecker(),
      tag: "connectivity", permanent: true);
  await Get.putAsync<Dio>(() => TodoClient().init(),
      tag: 'client', permanent: true);
}
