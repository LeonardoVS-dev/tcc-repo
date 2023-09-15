import 'package:flutter/material.dart';

class paginaMais extends StatefulWidget {
  const paginaMais({super.key});

  @override
  State<paginaMais> createState() => _paginaMaisState();
}

class _paginaMaisState extends State<paginaMais> {
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
                    icon: const Icon(Icons.arrow_back),
                  ),
                  title: const Text(
                    'Saiba mais',
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