import 'package:flutter/material.dart';
import 'package:terceiroteste/pages/configs.dart';
import 'package:terceiroteste/pages/historico.dart';
import 'package:terceiroteste/pages/login.dart';
import 'package:terceiroteste/pages/more.dart';
import 'package:terceiroteste/pages/processos.dart';
import 'index.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const mainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 59, 52, 52),
        //colorSchemeSeed: const Color.fromARGB(255, 59, 52, 52),
        //colorSchemeSeed: Color.fromARGB(255, 129, 27, 27),
        fontFamily: 'UberMove',
      ),
      routes: {
        '/login': (_) => const loginPage(),
        '/index': (_) => const mainPage(),
        '/historico': (_) => const paginaDeHistorico(),
        '/processos': (_) => const paginaDeProcessos(),
        '/config': (_) => const paginaConfig(),
        '/more': (_) => const paginaMais(),
      },
    );
  }
}


