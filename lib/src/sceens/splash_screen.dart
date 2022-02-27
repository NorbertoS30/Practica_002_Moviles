import 'package:flutter/material.dart';
import 'package:practica_02_conversor_temperatura/src/sceens/converter_screen.dart';
import 'package:practica_02_conversor_temperatura/src/utils/colors_palette.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: ConverterScreen(),
      backgroundColor: ColorPalette.colorPrimary,
      duration: 5000,
      imageSrc: "assets/images/thermometer.png",
      imageSize: 200,
      text: "Norber Apps Dev. 2.0",
      textStyle: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: ColorPalette.colorFont,
        fontFamily: "ArchitectsDaughter"
      )
    );
  }
}