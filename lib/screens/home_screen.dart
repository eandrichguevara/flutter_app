import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sismos/providers/earthquakes_provider.dart';
import 'package:sismos/providers/theme_provider.dart';
import 'package:sismos/widgets/earthquake_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _earthquakeListController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final earthquakeProviderNoListen =
        Provider.of<EarthquakesProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      //Inicio del AppBar
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        //Inicio del Titulo
        title: RichText(
          text: TextSpan(
              text: 'Sismos',
              style: Theme.of(context).textTheme.headline6,
              children: [
                TextSpan(
                    text: ' - Magnitud Local o Richter',
                    style: Theme.of(context).textTheme.bodyText1)
              ]),
        ),
        //Fin del Titulo
        actions: [
          //Switch para activar el modo oscuro
          Switch(
              value: !Provider.of<ThemeProvider>(context).isDarkTheme,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .setThemeMode()),
          //Boton que nos permite invertir el orden en el EarthquakeList
          IconButton(
            onPressed: () {
              earthquakeProviderNoListen.setFilterEarthquakeAsc(
                  filterOrderAsc:
                      !(earthquakeProviderNoListen.filterOrderAsc ?? true));
            },
            icon: Icon(
                (Provider.of<EarthquakesProvider>(context).filterOrderAsc ??
                        true)
                    ? Icons.arrow_downward
                    : Icons.arrow_upward),
            color: Colors.white,
          )
        ],
      ),
      //Fin del AppBar
      //Mostramos la lista de Sismos
      body: EarthquakesList(controller: _earthquakeListController),
    );
  }
}
