import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:us_food/db_food/db_food.dart';
import 'package:us_food/pages/food/binding.dart';
import 'package:us_food/pages/food/view.dart';
import 'package:us_food/pages/food_first/food_add/food_add_binding.dart';
import 'package:us_food/pages/food_first/food_add/food_add_view.dart';
import 'package:us_food/pages/food_first/food_first_binding.dart';
import 'package:us_food/pages/food_first/food_first_view.dart';
import 'package:us_food/pages/food_first/food_list/food_list_binding.dart';
import 'package:us_food/pages/food_first/food_list/food_list_view.dart';
import 'package:us_food/pages/food_second/food_second_binding.dart';
import 'package:us_food/pages/food_second/food_second_view.dart';
import 'package:us_food/pages/food_tab/food_tab_binding.dart';
import 'package:us_food/pages/food_tab/food_tab_view.dart';
import 'package:us_food/tools/fod.dart';

Color primaryColor = const Color(0xff66bb00);
Color bgColor = const Color(0xfff8f8f8);

List<String> foodTitles = [
  'Pacific Food',
  'Southwest Food',
  'Cajun',
  'Soul Food',
  'New York Food',
  'New England Food'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBFood().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Ppags,
      initialRoute: '/init',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}

List<GetPage<dynamic>> Ppags = [
  GetPage(name: '/init', page: () => const FoodPage(),binding: FoodBinds()),
  GetPage(name: '/food_tab', page: () => FoodTabPage(), binding: FoodTabBinding()),
  GetPage(name: '/food_first', page: () => FoodFirstPage(),binding: FoodFirstBinding()),
  GetPage(name: '/food_second', page: () => FoodSecondPage(),binding: FoodSecondBinding()),
  GetPage(name: '/food_add', page: () => FoodAddPage(),binding: FoodAddBinding()),
  GetPage(name: '/food_list', page: () => FoodListPage(),binding: FoodListBinding()),
  GetPage(name: '/fod', page: () => const FodView()),
];
