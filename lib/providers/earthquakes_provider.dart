import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:sismos/models/earthquakes_response.dart';

class EarthquakesProvider extends ChangeNotifier {
  final String _baseUrl = "api.gael.cloud";
  final String _path = "/general/public/sismos";

  List<Earthquake> onDisplayEarthquakes = [];

  String? filter;
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

  setFilter({required String filter}) {
    switch (filter) {
      case 'fecha':
        onDisplayEarthquakes
            .sort((a, b) => a.fecha.difference(b.fecha).inMinutes);
        setFilterEarthquakeAsc(filterOrderAsc: false);
        break;
      case 'magnitud':
        onDisplayEarthquakes.sort((a, b) =>
            (a.magnitudDouble * 10).truncate() -
            (b.magnitudDouble * 10).truncate());
        setFilterEarthquakeAsc(filterOrderAsc: false);
        break;
    }
    this.filter = filter;
  }

  setFilterEarthquakeAsc({required bool filterOrderAsc}) {
    this.filterOrderAsc = filterOrderAsc;
    onDisplayEarthquakes = onDisplayEarthquakes.reversed.toList();
    notifyListeners();
  }
}
