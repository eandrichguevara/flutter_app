import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sismos/providers/earthquakes_provider.dart';
import 'package:sismos/widgets/earthquake_item.dart';
import 'package:sismos/widgets/earthquake_list_filter.dart';

class EarthquakesList extends StatefulWidget {
  final ScrollController controller;
  const EarthquakesList({Key? key, required this.controller}) : super(key: key);

  @override
  State<EarthquakesList> createState() => _EarthquakesListState();
}

class _EarthquakesListState extends State<EarthquakesList> {
  @override
  Widget build(BuildContext context) {
    //Inicializacion del provider de los sismos
    final earthquakesProvider = Provider.of<EarthquakesProvider>(context);

    widget.controller.addListener(() {
      setState(() {});
    });

    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20))),
        //Constructor de la lista de Sismos
        child: earthquakesProvider.onDisplayEarthquakes.isNotEmpty
            ? ListView.builder(
                controller: widget.controller,
                //Agregamos 1 item para insertar el filtro
                itemCount: earthquakesProvider.onDisplayEarthquakes.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const EarthquakeListFilter();
                  }
                  return EarthquakeItem(
                      earthquake:
                          //Restamos 1 al index para compensar el que agregamos
                          earthquakesProvider.onDisplayEarthquakes[index - 1]);
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
