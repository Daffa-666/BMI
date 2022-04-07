import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi_result.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  String nama = "";
  String jk = 'Laki';
  int umur = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text('MENGHITUNG BMI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Image.asset(
                'images/img.png',
                height: 120,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(10),
              // color: Colors.blue[700],
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              nama = (txt);
                            });
                          },
                          keyboardType: TextInputType.text,
                          maxLength: 20,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Nama',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              tinggi = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              suffix: Text('cm'),
                              filled: true,
                              hintText: 'Tinggi'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              berat = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                              suffix: Text('kg'),
                              filled: true,
                              hintText: 'Berat'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          onChanged: (txt) {
                            setState(() {
                              umur = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration:
                          InputDecoration(
                            filled: true,
                            hintText: 'Umur',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 6),
                          child: DropdownButton<String>(
                            onChanged: (String? newValue) {
                              setState(() {
                                jk = newValue!;
                              });
                            },
                            value: jk,
                            icon: Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            items: <String>['Laki', 'Perempuan']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                          tinggi_badan: tinggi,
                          berat_badan: berat,
                          nama_orang: nama,
                          jenis_kelamin: jk,
                          umur_orang: umur,
                        )
                    ),
                  );
                },
                // textColor: Colors.white,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}