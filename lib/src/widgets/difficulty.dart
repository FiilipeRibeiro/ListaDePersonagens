import 'package:flutter/material.dart';

class Nivel extends StatefulWidget {
  final int nivellevel;

  const Nivel({super.key, required this.nivellevel});

  @override
  State<Nivel> createState() => _NivelState();
}

class _NivelState extends State<Nivel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: (widget.nivellevel >= 1)
              ? Colors.orange
              : Colors.orange[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: (widget.nivellevel >= 2)
              ? Colors.orange
              : Colors.orange[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: (widget.nivellevel >= 3)
              ? Colors.orange
              : Colors.orange[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: (widget.nivellevel >= 4)
              ? Colors.orange
              : Colors.orange[100],
          size: 16,
        ),
        Icon(
          Icons.star,
          color: (widget.nivellevel >= 5)
              ? Colors.orange
              : Colors.orange[100],
          size: 16,
        ),
      ],
    );
  }
}
