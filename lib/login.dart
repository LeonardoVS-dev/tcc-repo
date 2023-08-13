import 'package:flutter/material.dart';
import 'globals.dart' as globals;

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _controladorSenha = TextEditingController();
  final _controladorEmail = TextEditingController();

  @override
  Widget build(BuildContext contextLoginPage) {
    return Builder(
      builder: (contextLoginPage) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Scaffold(
            body: SafeArea(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                              
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/image-removebg-preview(1).png'),
                        ),
                        Container(
                          child: const Text(
                            'Faça o login:',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 20),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                controller: _controladorEmail,
                                obscureText: false,
                              
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.account_circle),
                                  iconColor: Colors.black,
                                  labelText: 'Email',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _controladorEmail.clear();
                                    },
                                    icon: const Icon(Icons.clear),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              
                              child: TextField(
                                controller: _controladorSenha,
                                obscureText: true,
                                
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.lock),
                                  iconColor: Colors.black,
                                  labelText: 'Senha',
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _controladorSenha.clear();
                                    },
                                    icon: const Icon(Icons.clear),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              if(_controladorEmail.text == '' || _controladorSenha == '') {
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: const Text('É preciso preencher os dois campos para poder entrar.'),
                                        actions: [
                                        TextButton(
                                          child: const Text('Voltar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  }
                                );
                              }
                              else {
                                (
                                Navigator.pushNamed(
                                  contextLoginPage, '/index',
                                  arguments: globals.emailUsuario = _controladorEmail.text,
                                )
                              );
                              }
                            },
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(const EdgeInsets.all(18)),
                              minimumSize:
                                  MaterialStateProperty.all(const Size(130, 40)),
                              elevation: MaterialStateProperty.all(10),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.redAccent[700],
                              ),
                            ),
                            child: const Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}