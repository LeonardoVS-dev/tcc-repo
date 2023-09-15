import 'package:flutter/material.dart';

class paginaConfig extends StatefulWidget {
  const paginaConfig({super.key});

  @override
  State<paginaConfig> createState() => _paginaConfigState();
}

class _paginaConfigState extends State<paginaConfig> {
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
                    icon: const Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                  title: const Text(
                    'Configurações',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 59, 52, 52),
                ),
                Expanded(

                  //aqui
                  child: Container(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}