import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  bool isDarkTheme;

//Inicializador del provider del tema
  ThemeProvider({required this.isDarkTheme})
      : currentTheme = isDarkTheme ? lightTheme() : darkTheme();

//Metodo que cambia el tema
  setThemeMode() {
    currentTheme = isDarkTheme ? darkTheme() : lightTheme();
    isDarkTheme = !isDarkTheme;

    //Metodo que notifica a los widgets que cambien de tema
    notifyListeners();
  }
}

//Tema normal de la appp
ThemeData lightTheme() {
  return ThemeData(
    primaryColor: Colors.teal,
    backgroundColor: Colors.white70,
    //Aca establecemos los temas para los textos
    textTheme: TextTheme(
        //Utilizado para indicar la agencia en el EarthquakeItem
        headline3: GoogleFonts.sixCaps(
            textStyle: const TextStyle(
                color: Colors.teal, fontWeight: FontWeight.w400, fontSize: 42)),
        //Titulo de la AppBar
        headline6: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700)),
        //Texto informativo con fondo de color primary
        bodyText1: GoogleFonts.openSans(
            textStyle: const TextStyle(
          color: Colors.white,
        )),
        //Texto informativo con fondo de color background
        bodyText2: GoogleFonts.openSans(
            textStyle: const TextStyle(
          color: Colors.black,
        )),
        //Testo usado para señalar la refGeografica en el EartquakeItem
        labelMedium: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 16,
                overflow: TextOverflow.clip)),
        //Testo usado para señalar la fecha en el EartquakeItem
        subtitle1: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w500,
                fontSize: 12)),
        //Testo usado para señalar la longitud y latitud en el EartquakeItem
        subtitle2: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.black45,
                fontWeight: FontWeight.w700,
                fontSize: 11))),
  );
}

//Tema oscuro de la appp
ThemeData darkTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    backgroundColor: Colors.grey[900]?.withOpacity(0.7),
    //Aca establecemos los temas para los textos
    textTheme: TextTheme(
        //Utilizado para indicar la agencia en el EarthquakeItem
        headline3: GoogleFonts.sixCaps(
            textStyle: const TextStyle(
                color: Colors.teal, fontWeight: FontWeight.w400, fontSize: 42)),
        //Titulo de la AppBar
        headline6: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700)),
        //Texto informativo con fondo de color primary
        bodyText1: GoogleFonts.openSans(
            textStyle: const TextStyle(
          color: Colors.white,
        )),
        //Texto informativo con fondo de color background
        bodyText2: GoogleFonts.openSans(
            textStyle: const TextStyle(
          color: Colors.white,
        )),
        //Testo usado para señalar la refGeografica en el EartquakeItem
        labelMedium: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 16,
                overflow: TextOverflow.clip)),
        //Testo usado para señalar la fecha en el EartquakeItem
        subtitle1: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                fontSize: 12)),
        //Testo usado para señalar la longitud y latitud en el EartquakeItem
        subtitle2: GoogleFonts.openSans(
            textStyle: const TextStyle(
                color: Colors.white60,
                fontWeight: FontWeight.w700,
                fontSize: 11))),
  );
}
