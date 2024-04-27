import 'package:flutter/material.dart';
import 'package:lista_de_personagens/src/data/dao.dart';
import 'package:lista_de_personagens/src/widgets/difficulty.dart';

// ignore: must_be_immutable
class Personagens extends StatefulWidget {
  final String name;
  final String image;
  final int nivel;

  int level = 0;

  Personagens(
      {super.key,
      required this.name,
      required this.image,
      required this.nivel});

  @override
  State<Personagens> createState() => _PersonagensState();
}

class _PersonagensState extends State<Personagens> {
  bool assertOrNetwork() => widget.image.contains('https');
  Color cor = const Color.fromARGB(255, 218, 152, 12);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Container(
            width: 420,
            height: 140,
            decoration: BoxDecoration(
              color: cor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 82, 78, 78),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: assertOrNetwork()
                                ? Image.network(
                                    widget.image,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset('assets/sem-foto.png')),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: const TextStyle(fontSize: 26),
                            ),
                          ),
                          Nivel(
                            nivellevel: widget.nivel,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onLongPress: () {
                              PersonagemProvider().delete(widget.name);
                              setState(() {});
                            },
                            onPressed: () {
                              setState(() {
                                widget.level++;
                                if (widget.level >= widget.nivel * 10) {
                                  widget.level = 0;
                                  cor = Colors.green;
                                }
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              backgroundColor: cor,
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_drop_up,
                                  color: Colors.white,
                                ),
                                Text(
                                  'Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.nivel > 0)
                              ? (widget.level / widget.nivel) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        'Level: ${widget.level}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
