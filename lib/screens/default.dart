import 'package:facebook_interface/Components/navegacao_abas.dart';
import 'package:facebook_interface/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Default extends StatefulWidget {
  const Default({super.key});

  @override
  State<Default> createState() => _DefaultState();
}

class _DefaultState extends State<Default> {
  final List<Widget> _telas = [
    const Home(),
    const Scaffold(
      backgroundColor: Colors.amber,
    ),
    const Scaffold(
      backgroundColor: Colors.orange,
    ),
    const Scaffold(
      backgroundColor: Colors.green,
    ),
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
    const Scaffold(
      backgroundColor: Colors.blueAccent,
    ),
  ];

  final List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu
  ];
  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        body: TabBarView(
          children: _telas,
        ),
        bottomNavigationBar: NavegacaoAbas(
          icones: _icones,
          indiceAbaSelecionada: _indiceAbaSelecionada,
          onTap: (indice) {
            setState(() {
              _indiceAbaSelecionada = indice;
            });
          },
        ),
      ),
    );
  }
}
