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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network('https://play.google.com/about/howplayworks/static/assets/social/share_google_play_logo.png'),
              const Text(
                '1. Introdução',
                style: TextStyle(color: Color.fromARGB(255, 241, 230, 230), fontSize: 22, fontWeight: FontWeight.bold),
          
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Termos aplicáveis. Agradecemos por usar oay O Play é um serviço fornecidoLC (Google•. ou •nós*), localizada em 1600 Aphitheatre Parkway, Mountain View CalifórniaEUA. O uso que faz do Google Play e dos pps (incluindo os Instant Apps Android), músicas. filmes. livros. revistas ou outros conteúdos ou serviços digitais (denominados "Conteúdo") disponíveisPlay está sujeito aos Termos de Serviço Google Play e aos Termos de Serviço do CTdSGoogle•) (conjuntamente denominados "Termos"). O Play é um "Serviço" conforme escrito nos TdS do Google. Se houver algum conflito os Termos de Serviço do Play e os TdS dole. OS Termos de Serviço do Google Play',
                 style: TextStyle(color: Color.fromARGB(255, 241, 230, 230), fontSize: 16, fontWeight: FontWeight.normal),
              ),
               const Text(
                '2. Seu uso do Google Play',
                style: TextStyle(color: Color.fromARGB(255, 241, 230, 230), fontSize: 22, fontWeight: FontWeight.bold),
                
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Acesso e uso do Conteúdo. pode utilizar o GooglePlay para procurar. localizar, visualizar e fazer streaming erou download de Conteúdo para seu dispositivo móvel. TV. smartwatch ou outro dispositivo compatível (Dispositivo *). Para utilizar o Play. voce necessita de Dispositivo que atenda aos requisitos de sistema e de componibilidade do Conteúdo relevante, tenha acesso àInternet e use software compatível. A disponibilidade de Conteúdo e de recursos varia entre os países. Nem todos os recursos e Conteúdos podem estar disponíveis no seu país. Alguns Conteúdos estar disponíveis para compartilhamento com membros da familia O Conteúdo pode ser oferecido pelo Google ou disponibilizado por terceiros náo afiliados ao Google. O Google nao é responsável nem endossa o Conteúdo disponibilizado meio do Google Play quando a origem do material náo é o próprio Google',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
              ),
            ],
          ),
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
