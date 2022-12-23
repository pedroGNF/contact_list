import 'package:flutter/material.dart';
import 'add_contact.dart';
import 'termos_de_uso.dart';

void main() {
  runApp(const Lista(
    title: 'Lista de Contatos',
  ));
}

class Lista extends StatelessWidget {
  const Lista({super.key, required String title});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Contact List App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();
    contatos.add(Contato(
        nome: "Pedro",
        telefone: "(91) 98747-9594",
        tipo: ContatoType.favorito));

    contatos.add(Contato(
        nome: "Beatriz", telefone: "(91) 97935-0397", tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Danielle",
        telefone: "(91) 90474-1045",
        tipo: ContatoType.celular));

    contatos.add(Contato(
        nome: "Lia", telefone: "(91) 97490-7028", tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Clara", telefone: "(91) 93581-9086", tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Amanda",
        telefone: "(91) 95638-0103",
        tipo: ContatoType.trabalho));

    contatos.add(Contato(
        nome: "Roberto",
        telefone: "(91) 93684-0246",
        tipo: ContatoType.trabalho));

    contatos.add(Contato(
        nome: "Maria", telefone: "(91) 92634-5687", tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Geovanna",
        telefone: "(91) 93609-6067",
        tipo: ContatoType.celular));

    contatos.add(Contato(
        nome: "Ely", telefone: "(91) 96013-2267", tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Camila",
        telefone: "(91) 90789-1588",
        tipo: ContatoType.favorito));

    contatos.add(Contato(
        nome: "Sofia",
        telefone: "(91) 90145-4740",
        tipo: ContatoType.favorito));

    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meus contatos'),
          actions: [
            IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => sendNewContato(context)),
          ],
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
                        fontSize: 40, 
                        color: Color.fromRGBO(33, 150, 243, 1)),
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
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromRGBO(48, 130, 197, 1),
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: const Icon(Icons.call_rounded,
                      color: Color.fromRGBO(13, 145, 68, 0.875)),
                  onPressed: () {},
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: contatos.length));
  }
}

sendNewContato(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => const AddContatos()));
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({required this.nome, required this.telefone, required this.tipo});
}

enum ContatoType { celular, trabalho, favorito, casa }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.celular:
        return const Icon(Icons.phone_android,
            color: Color.fromRGBO(224, 224, 224, 0.875));
      case ContatoType.trabalho:
        return const Icon(Icons.work, color: Color.fromRGBO(61, 46, 40, 1));
      case ContatoType.favorito:
        return const Icon(Icons.star,
            color: Color.fromRGBO(251, 255, 2, 0.784));
      case ContatoType.casa:
        return const Icon(Icons.home, color: Color.fromARGB(255, 165, 48, 27));
    }
  }
}
