import 'package:facebook_interface/screens/default.dart';
import 'package:facebook_interface/screens/home.dart';
import 'package:facebook_interface/utils/Paletas_cores.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    
    title: "Facebook",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(scaffoldBackgroundColor: PaletaCores.scaffold),
    //home: const Home(),
    home: Default(),
  ));
}
