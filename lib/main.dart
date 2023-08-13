import 'package:flutter/material.dart';
import 'package:terceiroteste/more.dart';
import 'login.dart';
import 'index.dart';
import 'historico.dart';
import 'processos.dart';
import 'configs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const loginPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 59, 52, 52),
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


