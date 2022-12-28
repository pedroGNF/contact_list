import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'main.dart';
import 'termos_de_uso.dart';

void main() {
  runApp(const AddContatos());
}

class AddContatos extends StatelessWidget {
  const AddContatos({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        title: 'Contato form',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Cadastro'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => backToList(context)),
            ],
          ),
          drawer: Drawer(
            elevation: 5,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text('Pedro'),
                  accountEmail: Text('pedrognfwork@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Text(
                      'P',
                      style: TextStyle(
                          fontSize: 40, color: Color.fromRGBO(33, 150, 243, 1)),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Novo Contato'),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const AddContatos()));
                  },
                ),
                ListTile(
                  title: const Text('Contatos'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Termos de uso'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const TermosDeUso(
                              title: 'Termos de Uso',
                            )));
                  },
                ),
              ],
            ),
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
                    maxLength: 999,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      TelefoneInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Celular"),
                    maxLength: 15,
                  ),
                  TextFormField(
                    validator: emailValidator(),
                    onChanged: emailUpdate(),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "E-mail"),
                    maxLength: 999,
                  ),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "CPF"),
                    maxLength: 14,
                  ),     
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          if (kDebugMode) {
                            Object? contato;
                            print(contato);
                          }
                        }
                      },
                      child: const Text("Salvar")),
                  ElevatedButton(
                      onPressed: () {
                        tema();
                      },
                      child: const Text("Tema"))
                ],
              ),
            ),
          ),
        ));
  }

  void updateTipoContato(ContatoType? value) {}

  // ignore: non_constant_identifier_names
  Observer(
      {required DropdownButtonFormField<ContatoType> Function(dynamic _)
          builder}) {}
}

void tema() {
  MaterialApp(darkTheme: ThemeData.light());
}

backToList(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const MyHomePage(
            title: 'oi',
          )));
}

class MyHomePageState extends State<MyHomePage> {
  ContatoModel contato = ContatoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Pedro'),
              accountEmail: Text('pedrognfwork@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
                child: Text(
                  'P',
                  style: TextStyle(
                      fontSize: 40, color: Color.fromRGBO(33, 150, 243, 1)),
                ),
              ),
            ),
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(48, 130, 197, 1),
              ),
              child: Text('Pedro\npedrognfwork@gmail.com'),
            ),
            ListTile(
              title: const Text('Novo Contato'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contatos'),
              onTap: () {
                Navigator.of(context).pop(MaterialPageRoute(
                    builder: (_) => const Lista(title: 'Lista de Contatos')));
              },
            ),
            ListTile(
              title: const Text('Termos de uso'),
              onTap: () {
                Navigator.of(context).pop(MaterialPageRoute(
                    builder: (_) => const TermosDeUso(title: 'Termos de Uso')));
              },
            ),
          ],
        ),
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
                  child: const Text("Salvar")),
              ElevatedButton(
                  onPressed: () {
                    tema();
                  },
                  child: const Text("Tema"))
            ],
          ),
        ),
      ),
    );
  }
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
