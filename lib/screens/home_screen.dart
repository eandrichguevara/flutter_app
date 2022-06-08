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
          //Boton que nos permite invertir el orden
          IconButton(
            onPressed: () {
              Provider.of<EarthquakesProvider>(context, listen: false)
                  .setFilterEarthquakeAsc();
              //Evita que se mueva el scroll hasta el final al activar el reverse en el ListView del EarthquakeList
              _earthquakeListController.jumpTo((Provider.of<
                              EarthquakesProvider>(context, listen: false)
                          .filterOrderAsc ??
                      true)
                  //El +50 y -50 son para indicar al usuario con un pequeño efecto que se a actualizado el orden
                  ? _earthquakeListController.position.maxScrollExtent + 50
                  : -50);
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
