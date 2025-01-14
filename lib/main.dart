import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/pages/client/products/list/client_products_list_page.dart';
import 'package:delivery_app/src/pages/client/profile/info/client_profile_info_page.dart';
import 'package:delivery_app/src/pages/client/profile/update/client_profile_update_page.dart';
import 'package:delivery_app/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:delivery_app/src/pages/home/home_page.dart';
import 'package:delivery_app/src/pages/login/login_page.dart';
import 'package:delivery_app/src/pages/register/register_page.dart';
import 'package:delivery_app/src/pages/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:delivery_app/src/pages/roles/roles_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


User userSession = User.fromJson(GetStorage().read('user') ?? {});
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('TOKEN DE SESION DE USUARIO: ${userSession.sessionToken}');
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      initialRoute: userSession.id != null ? userSession.roles!.length > 1 ? '/roles' : '/client/products/list' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/roles', page: () => RolesPage()),
        GetPage(name: '/restaurant/orders/list', page: () => RestaurantOrdersListPage()),
        GetPage(name: '/delivery/orders/list', page: () => DeliveryOrdersListPage()),
        GetPage(name: '/client/products/list', page: () => ClientProductsListPage()),
        GetPage(name: '/client/profile/info', page: () => ClientProfileInfoPage()),
        GetPage(name: '/client/profile/update', page: () => ClientProfileUpdatePage()),
      ],
      theme: ThemeData(
          primaryColor: Colors.green,
          colorScheme: const ColorScheme(
              primary: Colors.green,
              secondary: Colors.greenAccent,
              brightness: Brightness.light,
              onBackground: Colors.grey,
              onPrimary: Colors.grey,
              surface: Colors.grey,
              onSurface: Colors.grey,
              error: Colors.grey,
              onError: Colors.grey,
              onSecondary: Colors.grey,
              background: Colors.grey)),
      navigatorKey: Get.key,
    );
  }
}
