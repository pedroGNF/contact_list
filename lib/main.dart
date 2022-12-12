import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter List App'),
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
        nome: "Beatriz",
        telefone: "(91) 97935-0397",
        tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Danielle",
        telefone: "(91) 90474-1045",
        tipo: ContatoType.celular));

    contatos.add(Contato(
        nome: "Lia",
        telefone: "(91) 97490-7028",
        tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Clara", telefone: "(91) 93581-9086", tipo: ContatoType.casa));

    contatos.add(Contato(
        nome: "Amanda",
        telefone: "(91) 95638-0103",
        tipo: ContatoType.trabalho
        ));

    contatos.add(Contato(
        nome: "Roberto",
        telefone: "(91) 93684-0246",
        tipo: ContatoType.trabalho
        ));

    contatos.add(Contato(
        nome: "Maria",
        telefone: "(91) 92634-5687",
        tipo: ContatoType.casa
        ));

    contatos.add(Contato(
        nome: "Geovanna",
        telefone: "(91) 93609-6067",
        tipo: ContatoType.celular
        ));

    contatos.add(Contato(
        nome: "Ely",
        telefone: "(91) 96013-2267",
        tipo: ContatoType.casa
        ));

    contatos.add(Contato(
        nome: "Camila",
        telefone: "(91) 90789-1588",
        tipo: ContatoType.favorito
        ));

    contatos.add(Contato(
        nome: "Sofia",
        telefone: "(91) 90145-4740",
        tipo: ContatoType.favorito
        ));

    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            itemBuilder: (context, index) {
              var contato = contatos[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 1, 25, 145),
                  child: ContatoHelper.getIconByContatoType(contato.tipo),
                ),
                title: Text(contato.nome),
                subtitle: Text(contato.telefone),
                trailing: IconButton(
                  icon: const Icon(Icons.call_rounded, color: Color.fromARGB(223, 13, 145, 68)),
                   onPressed: () {  },
                  ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: contatos.length));
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;

  Contato({
    required this.nome,
    required this.telefone,
    required this.tipo,
  });
}

enum ContatoType { celular, trabalho, favorito, casa }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.celular:
        return const Icon(Icons.phone_android, color: Color.fromARGB(223, 224, 224, 224));
      case ContatoType.trabalho:
        return const Icon(Icons.work, color: Color.fromARGB(255, 61, 46, 40));
      case ContatoType.favorito:
        return const Icon(Icons.star, color: Color.fromARGB(200, 251, 255, 2));
      case ContatoType.casa:
        return const Icon(Icons.home, color: Color.fromARGB(255, 179, 153, 97));
    }
  }
}
