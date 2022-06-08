import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sismos/providers/earthquakes_provider.dart';
import 'package:sismos/widgets/earthquake_item.dart';

class EarthquakesList extends StatefulWidget {
  ScrollController controller;
  EarthquakesList({Key? key, required this.controller}) : super(key: key);

  @override
  State<EarthquakesList> createState() =>
      _EarthquakesListState(controller: controller);
}

class _EarthquakesListState extends State<EarthquakesList> {
  ScrollController controller;
  _EarthquakesListState({required this.controller});

  @override
  Widget build(BuildContext context) {
    //Inicializacion del provider de los sismos
    final earthquakesProvider = Provider.of<EarthquakesProvider>(context);

    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        //Constructor de la lista de Sismos
        child: earthquakesProvider.onDisplayEarthquakes.isNotEmpty
            ? ListView.builder(
                controller: controller,
                reverse: (earthquakesProvider.filterOrderAsc ?? true),
                itemCount: earthquakesProvider.onDisplayEarthquakes.length,
                itemBuilder: (BuildContext context, int index) {
                  return EarthquakeItem(
                      earthquake:
                          earthquakesProvider.onDisplayEarthquakes[index]);
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
