import 'package:flutter/material.dart';
import 'package:lista_de_personagens/src/models/sqflite_model.dart';
import '../../view-model/forms/forms_page_model.dart';

import 'package:lista_de_personagens/src/pages/home/widgets/personagens.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController nivelController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final FormsPageModel _pageModel = FormsPageModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Forms',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              width: 380,
              height: 760,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 199, 195, 195),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (_pageModel.valueValidator(value)) {
                          return 'Insira o nome do Personagem';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Name',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (_pageModel.difficultyValidator(value)) {
                          return 'Insira um nivel entre 1 e 5';
                        }
                        return null;
                      },
                      controller: nivelController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nivel',
                          fillColor: Colors.white70,
                          filled: true),
                    ),
                    TextFormField(
                      onChanged: (text) => setState(() {}),
                      validator: (value) {
                        if (_pageModel.valueValidator(value)) {
                          return 'Insira uma URL de imagem';
                        }
                        return null;
                      },
                      controller: imageController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.url,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Image',
                        fillColor: Colors.white70,
                        filled: true,
                      ),
                    ),
                    Container(
                      width: 110,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          imageController.text,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset('assets/sem-foto.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          PersonagemDao().save(
                            Personagens(
                              name: nameController.text,
                              image: imageController.text,
                              nivel: int.parse(nivelController.text),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text('Personagem adicionado com sucesso'),
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('Adicionar!'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
