
import 'package:anubiss/services/auth.dart';
import 'package:anubiss/view/homescreen.dart';
import 'package:anubiss/viewmodel/authMange.dart';
import 'package:anubiss/viewmodel/states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthServices()),
        ChangeNotifierProvider(create: (_)=>ManageState()),
        ChangeNotifierProvider(create: (_)=>AuthManagment()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
