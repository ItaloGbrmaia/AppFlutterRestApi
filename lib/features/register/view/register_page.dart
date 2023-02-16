import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  String get title => "Pagina de cadastro";

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/auth');
          },
        ),
        title: Text(
          widget.title,
        ),
        backgroundColor: const Color.fromARGB(255, 10, 43, 71),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Center(
                child: SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 29.0, right: 25.0, top: 0, bottom: 5),
                          child: Text(
                            'Nome completo*',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 0, bottom: 15),
                        child: SizedBox(
                          width: 400,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 0,
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              labelStyle: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 18,
                                  fontFamily: 'AvenirLight'),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 185, 183, 180)
                                      .withOpacity(0.4),
                              prefixIcon: const Icon(Icons.person),
                              hintText: 'Insira seu nome completo',
                            ),
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            validator: (name) {
                              if (name == null || name.isEmpty) {
                                return 'Digite seu nome';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 29.0, right: 25.0, top: 0, bottom: 5),
                          child: Text(
                            'E-mail*',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 0, bottom: 15),
                        child: SizedBox(
                          width: 400,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.grey),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              prefixIcon: const Icon(Icons.email),
                              hintText: 'Insira seu e-mail',
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 185, 183, 180)
                                      .withOpacity(0.4),
                            ),
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return 'Digite seu e-mail';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(_emailController.text)) {
                                return 'Por favor, digite um e-mail correto';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 29.0, right: 25.0, top: 0, bottom: 5),
                          child: Text(
                            'Telefone*',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 0, bottom: 15),
                        child: SizedBox(
                          width: 400,
                          height: 50,
                          child: TextFormField(
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: const Icon(Icons.phone),
                              hintText: '(00) 0000-0000',
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 185, 183, 180)
                                      .withOpacity(0.4),
                            ),
                            controller: _phoneController,
                            keyboardType: TextInputType.number,
                            validator: (phone) {
                              if (phone == null || phone.isEmpty) {
                                return 'Digite seu telefone';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 29.0, right: 25.0, top: 0, bottom: 5),
                          child: Text(
                            'Senha*',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25.0, right: 25.0, top: 0, bottom: 15),
                        child: SizedBox(
                          width: 400,
                          height: 50,
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              prefixIcon: const Icon(Icons.password),
                              hintText: 'Insira sua senha',
                              filled: true,
                              fillColor: Color.fromARGB(255, 185, 183, 180)
                                  .withOpacity(0.4),
                            ),
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            validator: (senha) {
                              if (senha == null || senha.isEmpty) {
                                return 'Digite sua senha';
                              } else if (senha.length < 6) {
                                return 'Por Favor, digite uma senha maior que 6 carctetes!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.topLeft,
                      //   child: const Padding(
                      //     padding: EdgeInsets.only(
                      //         left: 29.0, right: 25.0, top: 0, bottom: 5),
                      //     child: Text(
                      //       'Confirmar sua senha*',
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(
                      //       left: 25.0, right: 25.0, top: 0, bottom: 15),
                      //   child: SizedBox(
                      //     width: 400,
                      //     height: 50,
                      //     child: TextFormField(
                      //       obscureText: true,
                      //       decoration: InputDecoration(
                      //         enabledBorder: OutlineInputBorder(
                      //           borderSide: const BorderSide(
                      //               width: 0, color: Colors.grey),
                      //           borderRadius: BorderRadius.circular(10.0),
                      //         ),
                      //         prefixIcon: const Icon(Icons.password),
                      //         hintText: 'Insira sua senha',
                      //         filled: true,
                      //         fillColor:
                      //             const Color.fromARGB(255, 185, 183, 180)
                      //                 .withOpacity(0.4),
                      //       ),
                      //       keyboardType: TextInputType.text,
                      //       controller: null,
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, top: 15, bottom: 0),
                        child: SizedBox(
                          width: 250,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: (() async {
                              if (_formKey.currentState!.validate()) {
                                bool create = await cad();

                                // ignore: unused_local_variable
                                FocusScopeNode currentFocus =
                                    // ignore: use_build_context_synchronously
                                    FocusScope.of(context);

                                if (create) {
                                  // ignore: use_build_context_synchronously
                                  Modular.to.navigate('/home');
                                } else {
                                  _passwordController.clear();
                                  _nameController.clear();
                                  _phoneController.clear();
                                  _emailController.clear();
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            }),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 164, 44),
                              shape: const BeveledRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Criar uma Conta',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final snackBar = const SnackBar(
    content: Text(
      'E-mail ou senha e Invalido',
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );

  Future<bool> cad() async {
    var header = {
      'app': 'ee85db5d-ebec-4548-a62b-ae8c68955d31',
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json'
    };

    try {
      var request = Uri.parse('https://bis365.com.br/bid365/api/v1/auth/users');
      final response = await http.post(request,
          body: json.encode({
            "name": _nameController.text,
            "email": _emailController.text,
            "password": _passwordController.text,
            "phone": _phoneController.text
          }),
          headers: header);

      print(response.headers);
      if (response.statusCode == 200) {
        print(json.decode(response.body));

        return true;
      } else {
        print(jsonDecode(response.body));
        throw Exception('Falha ao autenticar');
      }
      // ignore: nullable_type_in_catch_clause
    } catch (e) {
      print('error caught: $e');
      return false;
    }
  }
}
