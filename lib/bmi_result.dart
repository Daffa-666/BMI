import 'package:flutter/material.dart';
import 'dart:math';

class BMIResult extends StatelessWidget {
  BMIResult(
      {required this.tinggi_badan,
        required this.berat_badan,
        required this.nama_orang,
        required this.jenis_kelamin,
        required this.umur_orang,
      }
      );

  final int tinggi_badan;
  final int berat_badan;
  final String nama_orang;
  final String jenis_kelamin;
  final int umur_orang;

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    String cBMI;
    if (bmi >= 28)
      cBMI = "Obese";
    else if (bmi >= 23)
      cBMI = "Overweight";
    else if (bmi >= 17.5)
      cBMI = "Normal";
    else
      cBMI = "Underweight";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              nama_orang,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              jenis_kelamin,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              umur_orang.toString()+" tahun",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              cBMI,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            Text(
              'Normal BMI Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black45,
              ),
            ),
            Text(
              '17,5 -  22.9 ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}