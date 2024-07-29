import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_info_app/controller/user_controller.dart';
import 'package:user_info_app/view/users_info_page.dart';

void main() =>
  runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
 
   
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider( 
      create: (context) => UserController(),  //here we register the controller at the top 
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pixel6 Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const UserInfoHomePage()
      ),
    );
  }
}
