import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sismos/providers/earthquakes_provider.dart';
import 'package:sismos/providers/theme_provider.dart';
import 'package:sismos/screens/home_screen.dart';

void main() => runApp(const AppState());

//Widget donde se inicializan los providers
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Provider de Sismos
        ChangeNotifierProvider(
          create: (_) => EarthquakesProvider(),
          lazy: false,
        ),
        //Provider del Tema de la App (Modo Oscuro)
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(isDarkTheme: true), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {'home': (context) => const HomeScreen()},
      //Con esto se mantiene en escucha el tema actual
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
