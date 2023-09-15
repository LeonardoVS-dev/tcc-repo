import 'package:flutter/material.dart';

class paginaDeHistorico extends StatefulWidget {
  const paginaDeHistorico({super.key});

  @override
  State<paginaDeHistorico> createState() => _paginaDeHistoricoState();
}

class _paginaDeHistoricoState extends State<paginaDeHistorico> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                AppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/index');
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white,)
                  ),
                  title: const Text(
                    'Histórico de informações',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 59, 52, 52),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}