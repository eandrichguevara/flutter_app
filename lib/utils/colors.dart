import 'package:flutter/material.dart';

class EarthquakeColors {
  //Lista de colores que se utilizara como guia visual de la fuerza del sismo
  static final List<Color> _colorsMagnitude = <Color>[
    Colors.amber.shade500,
    Colors.amber.shade600,
    Colors.amber.shade700,
    Colors.orange.shade600,
    Colors.orange.shade700,
    Colors.orange.shade800,
    Colors.orange.shade900,
    Colors.deepOrange.shade600,
    Colors.deepOrange.shade700,
    Colors.deepOrange.shade800,
    Colors.red.shade600,
    Colors.red.shade700,
    Colors.red.shade800,
  ];

  static Color getMagnitudeColor({required double magnitude}) {
    //Diferencia en la Magnitud Local considerando la cantidad de colores
    // 8.0 es el rango de las magnitudes de Ml 2.0 a 10.0
    final colorsIndex =
        ((magnitude - 2.0) / (8.0 / (_colorsMagnitude.length - 1))).truncate();

    return _colorsMagnitude[colorsIndex];
  }
}
