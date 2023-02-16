import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import '../../../components/textformfield.dart';
import '../components/loginbutton.dart';
import '../components/textauthpage.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(title: Text('Login Page')),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Form(
                key: _formKey,
                child: Center(
                  child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: SizedBox(
                              width: 400,
                              height: 220,
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const TextAuthPage(
                            text: Text(
                              'Entrar',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.only(
                                left: 0.0, right: 100, top: 5, bottom: 0),
                          ),
                          const TextAuthPage(
                            text: Text(
                                'Por favor Insira suas credenciais para prosseguir'),
                            padding: EdgeInsets.only(
                                left: 0.0, right: 100, top: 5, bottom: 10),
                          ),
                          const TextAuthPage(
                            text: Text(
                              'E-Mail',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.only(
                                left: 0.0, right: 100, top: 0, bottom: 10),
                          ),
                          TextFormGlobal(
                            Controller: _emailController,
                            Validate: (email) {
                              if (email == null || email.isEmpty) {
                                return 'Digite seu e-mail';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(_emailController.text)) {
                                return 'Por favor, digite um e-mail correto';
                              }
                              return null;
                            },
                            icon: const Icon(Icons.person),
                            text: 'Insira seu E-mail',
                          ),
                          const TextAuthPage(
                            text: Text(
                              'Senha',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.only(
                                left: 0, right: 100, top: 15, bottom: 10),
                          ),
                          TextFormGlobal(
                            Controller: _passwordController,
                            Validate: (senha) {
                              if (senha == null || senha.isEmpty) {
                                return 'Digite sua senha';
                              } else if (senha.length < 6) {
                                return 'Por Favor, digite uma senha maior que 6 carctetes!';
                              }
                              return null;
                            },
                            icon: Icon(Icons.password),
                            text: 'Insira sua Senha',
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 25, bottom: 0),
                            child: SizedBox(
                              width: 250,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: (() async {
                                  if (_formKey.currentState!.validate()) {
                                    bool singIn = await login();

                                    // ignore: unused_local_variable
                                    FocusScopeNode currentFocus =
                                        // ignore: use_build_context_synchronously
                                        FocusScope.of(context);

                                    if (singIn) {
                                      // ignore: use_build_context_synchronously
                                      Modular.to.navigate('/home');
                                    } else {
                                      _passwordController.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  }
                                }),
                                //////////lasldksaldksa
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
                                  'Fazer Login',
                                ),
                              ),
                            ),
                          ),
                          ResgisterButton(
                            on_pressed: (() async {
                              Modular.to.navigate('/register');
                            }),
                            text: 'Cadastro',
                          ),
                        ],
                      )),
                ))
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

  Future<bool> login() async {
    var header = {
      'app': 'ee85db5d-ebec-4548-a62b-ae8c68955d31',
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json'
    };

    try {
      var request = Uri.parse('https://bis365.com.br/bid365/api/v1/auth/login');
      final response = await http.post(request,
          body: json.encode({
            "username": _emailController.text,
            "password": _passwordController.text
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
