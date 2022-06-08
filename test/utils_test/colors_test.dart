import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:sismos/utils/colors.dart';

void main() {
  group('Magnitude Colors', () {
    test(
        'Si ingreso una magnitud menor a 2.0  debe devolver el Color establecido como minimo',
        () {
      expect(EarthquakeColors.getMagnitudeColor(magnitude: 2.0),
          Colors.amber.shade500);
    });

    test(
        'Si ingreso una magnitud mayor a 10.0 debe devolver el Color establecido como maximo',
        () {
      expect(EarthquakeColors.getMagnitudeColor(magnitude: 10.0),
          Colors.red.shade800);
    });

    test(
        'Si ingreso la magnitud 6.0 debe devolver el Color establecido como medio',
        () {
      expect(EarthquakeColors.getMagnitudeColor(magnitude: 6.0),
          Colors.orange.shade900);
    });
  });
}
