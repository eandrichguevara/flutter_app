import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:sismos/models/earthquakes_response.dart';

class EarthquakesProvider extends ChangeNotifier {
  final String _baseUrl = "api.gael.cloud";
  final String _path = "/general/public/sismos";

  List<Earthquake> onDisplayEarthquakes = [];

  bool? filterOrderAsc;

//Inicializacion del provider de sismos
  EarthquakesProvider() {
    getOnDisplayEarthquakes();
  }

//Metodo que recibe los sismos a travez de la API
  getOnDisplayEarthquakes() async {
    var url = Uri.https(_baseUrl, _path);

    final response = await http.get(url);

//La repuesta se maneja con el metodo earthwuakesFromJson que convierte la respuesta en una lista de objetos de tipo Earthquake
    onDisplayEarthquakes = earthquakesFromJson(response.body);

    //Metodo que notifica a los widgets que los sismos estan cargados
    notifyListeners();
  }

//Metodo que nos permite invertir el orden de la lista
  setFilterEarthquakeAsc() {
    filterOrderAsc = !(filterOrderAsc ?? true);
    notifyListeners();
  }
}
