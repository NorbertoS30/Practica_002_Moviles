
import 'package:flutter/material.dart';
import 'package:practica_02_conversor_temperatura/src/utils/colors_palette.dart';

class ConverterScreen extends StatefulWidget {
  ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {

  bool _isSelectedCentigrade = true;
  bool _isSelectedFahrenheit = false;

  //Controladores
  TextEditingController txtContDegrees = TextEditingController();

  //Variables
  var degreesTotal = 0.00;
  
  @override
  Widget build(BuildContext context) {

    TextFormField txtDegrees = TextFormField(
      controller: txtContDegrees,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Grados",
        hintStyle: TextStyle(
          color: ColorPalette.colorPrimary, fontWeight: FontWeight.bold
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)
      ),
    );

    ElevatedButton btnCalc = ElevatedButton(
      style: ElevatedButton.styleFrom(
        onPrimary: ColorPalette.colorBlack,
        primary: ColorPalette.colorCompPurple,
      ),
      onPressed: (){
        //CAlcular grados
        if(_isSelectedCentigrade == true)
        {
          degreesTotal = int.parse(txtContDegrees.text) * 1.8 + 32;
        }
        else
        {
          if(_isSelectedFahrenheit == true)
          {
            degreesTotal = (int.parse(txtContDegrees.text) - 32) / 1.8;
          }
        }
        setState(() {

        });
        Future.delayed(Duration(seconds: 2), (
        ){
          return showDialog(
            context: context, 
            builder: (BuildContext context) => 
            AlertDialog(
              title: Text("Rsultado de la Conversión"),
              content: Text("Total: $degreesTotal"),
            )
          );
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.calculate),
          Text("Calcular Total")
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Convertidor de Temperatura",
          style: TextStyle(
            color: ColorPalette.colorFont, 
            fontSize: 25.0,
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: ColorPalette.colorPrimary,
      ),
      body: Container(
        margin: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: ColorPalette.colorBack,    
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
            child: Column(
              children: [
                SizedBox(height: 25),
                ChoiceChip(
                  label: Text("Grados Centigrados"),
                  selected: _isSelectedCentigrade,
                  backgroundColor: ColorPalette.colorCompRed,
                  selectedColor: ColorPalette.colorSendary,
                  onSelected: (newBoolValue) {
                    setState(() {
                      _isSelectedCentigrade = newBoolValue;
                      _isSelectedFahrenheit = !newBoolValue;
                    });
                  },
                ),
                SizedBox(height: 2),
                ChoiceChip(
                  label: Text("Grados Fahrenheit"),
                  selected: _isSelectedFahrenheit,
                  backgroundColor: ColorPalette.colorCompRed,
                  selectedColor: ColorPalette.colorSendary,
                  onSelected: (newBoolValue) {
                    setState(() {
                      _isSelectedFahrenheit = newBoolValue;
                      _isSelectedCentigrade = !newBoolValue;
                    });
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 110, right: 110),
                  child: txtDegrees
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 85, right: 85),
                  child: btnCalc
                ),
                SizedBox(height: 25),
                Container(
                  child: Center(
                    child: Text(
                      "Total:   $degreesTotal", 
                      style: TextStyle(
                        color: ColorPalette.colorWhite,
                        fontSize: 30.0
                      ),
                    )
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}