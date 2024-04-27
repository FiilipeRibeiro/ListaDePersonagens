import 'package:flutter/material.dart';

import '../../data/dao.dart';
import '../../widgets/personagens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personagens',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed("/forms")
                    .then((value) => setState(() {}));
              },
              child: const Text('New'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Personagens>>(
          future: PersonagemProvider().findAll(),
          builder: (context, snapshot) {
            List<Personagens>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.active:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Personagens personagens = items[index];
                        return personagens;
                      },
                    );
                  }
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          'Não há nenhuma Tarefa',
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  );
                }
                return const Text('Erro ao carregar tarefas');
            }
          },
        ),
      ),
    );
  }
}
