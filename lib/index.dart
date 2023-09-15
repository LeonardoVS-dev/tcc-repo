import 'package:flutter/material.dart';
import 'package:terceiroteste/pages/globals.dart' as globals;


enum options {
  config, 
  more, 
  logOut,
}

late DateTime now =  DateTime.now();
DateTime date =  DateTime(now.year, now.month, now.day, now.hour, now.minute);



class mainPage extends StatefulWidget {
  const mainPage({super.key});
  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  options? selectedIndex;
  bool mostrar = false;
  initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext contextMainPage) {
    return Builder(builder: (contextMainPage) {
      return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color(0xff1f005c),
                Color(0xff5b0060),
                Color(0xff870160),
                Color(0xffac255e),
                Color(0xffca485c),
                Color(0xffe16b5c),
                Color(0xfff39060),
                Color(0xffffb56b),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
          child: ListView(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      '${now.hour}:${now.minute}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 72),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 30),

                    child: PopupMenuButton(
                      icon: const Icon(Icons.more_vert_outlined, color: Colors.white,),
                      initialValue: selectedIndex,
                      color: Colors.white,
                      onSelected: (options item) {
                        
                        if (item == options.config) {
                          setState(() {
                            Navigator.pushNamed(context, '/config');
                          });
                        }
                        else if (item == options.more) {
                          setState(() {
                            Navigator.pushNamed(context, '/more');
                          });
                        }
                        else if (item == options.logOut) {
                          showDialog(
                            context: context, 
                            builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Deseja sair?'),
                                  content: const Text('Tem certeza que deseja sair da conta? Será preciso entrar novamente.'),
                                  actions: [
                                  TextButton(
                                    child: const Text('Sair'),
                                    onPressed: () {
                                      setState(() {
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(context, '/login');
                                        globals.emailUsuario = '';
                                      });
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Cancelar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            }
                          );
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<options>>[
                        const PopupMenuItem<options>(
                          value: options.config,
                          child: Text('Configurações'),
                        ),
                        const PopupMenuItem<options>(
                          value: options.more,
                          child: Text('Saiba mais'),
                        ),
                        const PopupMenuItem<options>(
                          value: options.logOut,
                          child: Text('Sair'),
                        ),
                      ],
                    ),
                  ),

                ],
              ),

              Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Olá ${globals.emailUsuario}!',
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 20,

                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: () {},

                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 30, top: 15, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              child: const Text(
                                'Agora',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ],
                        ),
                        
                        if (mostrar == true) Visibility(
                          visible: true,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const textoCard(texto: 'O Arduino está em execução:'),
                            textoCard(texto: '${now.hour}h:${now.minute}m • ${now.year}/${now.month}/${now.day}'),
                            const textoCard(texto: 'Operador atual: XXX'),
                            const textoCard(texto: 'Temp. atual: XXX°C'), 
                          ],
                          ),
                        )
                        else const Visibility(
                          visible: true,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textoCard(texto: 'O Arduino está fora de execução.'),
                          ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
                color: Colors.white,
                shadowColor: Colors.black,
                elevation: 20,

                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/historico');
                  },
                  
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 15, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: const Text(
                                'Histórico',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 26,
                                ),
                              ),
                            ),

                            IconButton(
                              iconSize: 28,
                              splashRadius: 28,
                              onPressed: () {
                                debugPrint('teste de botao seta');
                                Navigator.pushNamed(
                                    context, '/historico');
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        const textoCard(texto: 'Veja o histórico de informações'),
                      ],
                    ),
                  ),
                ),
              ),
              
              GestureDetector(
                onTap: () {
                  debugPrint('teste de card');
                  Navigator.pushNamed(context, '/processos');
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(20),
                  color: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 20,

                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/processos');
                    },

                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: const Text(
                                  'Processos',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 26,
                                  ),
                                ),
                              ),

                              IconButton(
                                iconSize: 28,
                                splashRadius: 28,
                                onPressed: () {
                                  debugPrint('teste de botao seta');
                                  Navigator.pushNamed(
                                      context, '/processos');
                                },
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                ),
                              ),

                            ],
                          ),

                          const textoCard(texto: 'Veja o histórico de processos'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class textoCard extends StatelessWidget {
  final String texto;

  const textoCard({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          //overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}