// ignore_for_file: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       darkTheme: ThemeData.dark(),
      title: 'Contato form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ContatoModel contato = ContatoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Form(
        key: null,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 10,
            children: <Widget>[
              TextFormField(
                validator: nomeValidator(),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Nome"),
                maxLength: 100,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Celular"),
              ),
              TextFormField(
                validator: emailValidator(),
                onChanged: emailUpdate(),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "E-mail"),
                maxLength: 100,
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "CPF"),
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (kDebugMode) {
                        print(contato);
                      }
                    }
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }

  TextFieldValidator emailValidator() {
    return EmailValidator(errorText: 'email invalido.');
  }

  FieldValidator nomeValidator() {
    return MultiValidator([
      RequiredValidator(errorText: 'campo obrigatório'),
      MinLengthValidator(4, errorText: 'tamanho mínimo de 4 caracteres'),
    ]); // Multivalidator
  }
}

nomeUpdate(nome) {}

emailUpdate() {}

cpfValidator() {}

mixin _formKey {
  // ignore: prefer_typing_uninitialized_variables
  static var currentState;
}

class ContatoModel {
  late String nome;
  late String email;
  late String cpf;
  late String telefone;
  late ContatoType tipo;
}

enum ContatoType { celular, trabalho, favorito, casa }