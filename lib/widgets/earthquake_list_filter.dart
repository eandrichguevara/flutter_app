import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sismos/providers/earthquakes_provider.dart';

class EarthquakeListFilter extends StatelessWidget {
  const EarthquakeListFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Ordenar por:",
          style: Theme.of(context).textTheme.bodyText2,
        ),
        //Boton que ordena los sismos por fecha
        const ChipFilterButton(name: 'Fecha', filterString: 'fecha'),
        //Boton que ordena los sismos por magnitud
        const ChipFilterButton(name: 'Magnitud', filterString: 'magnitud')
      ],
    );
  }
}

class ChipFilterButton extends StatelessWidget {
  final String name;
  final String filterString;
  const ChipFilterButton(
      {Key? key, required this.name, required this.filterString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final earthquakeProvider = Provider.of<EarthquakesProvider>(context);
    final earthquakeProviderNoListen =
        Provider.of<EarthquakesProvider>(context, listen: false);
    return InputChip(
        label: Text(name,
            style: earthquakeProvider.filter == filterString
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.bodyText2),
        backgroundColor: Theme.of(context).backgroundColor,
        checkmarkColor: Theme.of(context).backgroundColor,
        selectedColor: Theme.of(context).primaryColor,
        selected: earthquakeProvider.filter == filterString,
        onSelected: (value) =>
            earthquakeProviderNoListen.setFilter(filter: filterString));
  }
}
