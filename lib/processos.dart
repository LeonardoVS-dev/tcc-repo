import 'package:flutter/material.dart';
import 'funcs/classProcessos.dart';

class paginaDeProcessos extends StatefulWidget {
  const paginaDeProcessos({super.key});

  @override
  State<paginaDeProcessos> createState() => _paginaDeProcessosState();
}

class _paginaDeProcessosState extends State<paginaDeProcessos> {
  final List<Processos> _listProcessos = Processos.generateItems(7);

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
                    'Histórico de processos',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 59, 52, 52),
                ),

                //ver dps
                Expanded(
                  child: ListView(
                    children: [
                      ExpansionPanelList(
                        expansionCallback: (int index, bool isExpanded) {
                          setState(() => _listProcessos[index].isExpanded = !isExpanded,);
                        },
                        /*children: _listProcessos/*.map<ExpansionPanel>*/(Processos processos){
                          return ExpansionPanel(
                            isExpanded: processos.isExpanded,
                            canTapOnHeader: true,
                            headerBuilder: 
                          );
                        }.toList(),*/
                      ),
                      Row(
                        children: [
                          const Text('Mostrar mais'),
                          IconButton(
                            onPressed: () {

                            }, 
                            icon: const Icon(Icons.add),
                          )
                        ],
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
