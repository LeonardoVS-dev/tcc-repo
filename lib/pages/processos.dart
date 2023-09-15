import 'package:flutter/material.dart';
//import 'package:flutter_application_1/funcs/classProcessos.dart';
import 'package:terceiroteste/funcs/api.dart';

import 'dart:convert';

class paginaDeProcessos extends StatefulWidget {
  const paginaDeProcessos({super.key});

  @override
  State<paginaDeProcessos> createState() => _paginaDeProcessosState();
}

class _paginaDeProcessosState extends State<paginaDeProcessos> {
  var users = List<readUser>.empty();

  _getUsers() {
    
    readAPI.getUsers().then((response) => 
      setState(() {
          Iterable list = json.decode(response.body);
          users = list.map((model) => readUser.fromJson(model)).toList();
      },)
    );
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/index');
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white,),
            ),
            title: const Text(
              'Histórico de processos',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color.fromARGB(255, 59, 52, 52),
          ),
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
            
                  //ver dps
                  Expanded(
                    child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Card(
                              child: Container(
                                margin: const EdgeInsets.only(top: 5,bottom: 5),
                                child: ListTile(
                                  title: Text(users[index].idUser),
                                  subtitle: Text('login: ${users[index].login}\npassword: ${users[index].password}'),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5,right: 5),
                              child: const Divider()
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
