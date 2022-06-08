import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sismos/models/earthquakes_response.dart';
import 'package:sismos/utils/colors.dart';

class EarthquakeItem extends StatelessWidget {
  final Earthquake earthquake;

  const EarthquakeItem({Key? key, required this.earthquake}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Recuadro que indica la agencia que registro el sismo
    Widget agenciaInicator = Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
          child: Text(
        earthquake.agencia,
        style: Theme.of(context).textTheme.headline3,
      )),
    );

//Informacion sobre la fecha, latitud, longitud, profundidad y la referencia del sismo
    Widget dataIndicator = SizedBox(
        //120 es el tamaño de la agencia y del indicador de magnitud
        width: MediaQuery.of(context).size.width * 0.9 - 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Referencia geografica
            Text(earthquake.refGeografica,
                style: Theme.of(context).textTheme.labelMedium),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //Fecha
              Text(
                DateFormat('yyyy-MM-dd hh:mm').format(earthquake.fecha),
                style: Theme.of(context).textTheme.subtitle1,
              ),
              //Profundidad
              Text(
                'Prof: ${earthquake.profundidad} mts',
                style: Theme.of(context).textTheme.subtitle1,
              )
            ]),
            //Latitud y Longitud
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Lat, Lon:",
                style: Theme.of(context).textTheme.subtitle2,
              ),
              Text(
                "${earthquake.latitud}, ${earthquake.longitud}",
                style: Theme.of(context).textTheme.subtitle2,
              )
            ]),
          ],
        ));

//Indicador de magnitud con colores que representan intensidad
    Widget magnitudeIndicator = Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          //Color segun intensidad
          color: EarthquakeColors.getMagnitudeColor(
              magnitude: earthquake.magnitudDouble),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
            child: Text(
          //Magnitud
          earthquake.magnitudDouble.toString(),
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        )));

    return Container(
      height: 80,
      margin: const EdgeInsets.all(2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          agenciaInicator,
          dataIndicator,
          magnitudeIndicator,
        ],
      ),
    );
  }
}
