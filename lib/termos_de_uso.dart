import 'package:flutter/material.dart';
import 'add_contact.dart';
import 'main.dart';

class Termos extends StatelessWidget {
  const Termos({super.key});

  static const appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const TermosDeUso(title: appTitle),
    );
  }
}

class TermosDeUso extends StatelessWidget {
  const TermosDeUso({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                'https://play.google.com/about/howplayworks/static/assets/logo/play_logo2x.webp'),
          ],
        ),
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => const Lista(
                          title: 'Lista de Contatos',
                        )));
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
    );
  }
}
