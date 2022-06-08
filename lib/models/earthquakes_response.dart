import 'dart:convert';

//Lo usamos para convertir la magnitud de tipo String a double
final justDouble = RegExp(r'^[0-9.]+');

List<Earthquake> earthquakesFromJson(String str) =>
    List<Earthquake>.from(json.decode(str).map((x) => Earthquake.fromJson(x)));

class Earthquake {
  Earthquake({
    required this.fecha,
    required this.latitud,
    required this.longitud,
    required this.profundidad,
    required this.magnitud,
    required this.magnitudDouble,
    required this.agencia,
    required this.refGeografica,
    required this.fechaUpdate,
  });

  DateTime fecha;
  String latitud;
  String longitud;
  String profundidad;
  String magnitud;
  double magnitudDouble;
  String agencia;
  String refGeografica;
  DateTime fechaUpdate;

  factory Earthquake.fromJson(Map<String, dynamic> json) => Earthquake(
        fecha: DateTime.parse(json["Fecha"]),
        latitud: json["Latitud"],
        longitud: json["Longitud"],
        profundidad: json["Profundidad"],
        magnitud: json["Magnitud"],
        magnitudDouble: double.parse(
            justDouble.firstMatch(json["Magnitud"])?.group(0) ?? '0'),
        agencia: json["Agencia"],
        refGeografica: json["RefGeografica"],
        fechaUpdate: DateTime.parse(json["FechaUpdate"]),
      );
}
