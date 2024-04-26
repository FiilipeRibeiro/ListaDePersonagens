import 'package:flutter/material.dart';

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
                Navigator.of(context).pushNamed("/forms");
              },
              child: const Text('New'),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Personagens(
            name: 'Rengoku',
            image:
                'https://i.pinimg.com/564x/e1/16/00/e11600ae8a6bce7dc143c3fab74d7723.jpg',
            nivel: 4,
          ),
          Personagens(
            name: 'Rengoku',
            image:
                'https://i.pinimg.com/564x/e1/16/00/e11600ae8a6bce7dc143c3fab74d7723.jpg',
            nivel: 4,
          ),
          Personagens(
            name: 'Rengoku',
            image:
                'https://i.pinimg.com/564x/e1/16/00/e11600ae8a6bce7dc143c3fab74d7723.jpg',
            nivel: 4,
          ),
        ],
      ),
    );
  }
}
