import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Receitas da vovó',
      home: Scaffold(
        appBar: AppBar(title: Text('Bolo de morango')),
        body: Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset('assets/images/bolo-chocolate-simples.jpg',
                      width: 200),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Bolo de chocolate",
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                      "asd asd asd asas as asd asd asd asd asd ad asd asd asd asd asd asd asd asd asd asd asd asd asd asd asd as as dasd as as das dasd as das das das dasd asd asd asd asd as asd asd asd asda sdasd asd asd assd fsdf sdf sdf sdf  wer w e rwer wer wr wef w sdf xcv xcvxv wefwerfwer wefsdf sdf sdfsd fwer wer wesdf gsd fgsfd sdf f werfwef wef sdf sdfsd fwef wef ssdf ",
                      style: TextStyle(color: Colors.black, fontSize: 12)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.green[500]),
                        Icon(Icons.star, color: Colors.green[500]),
                        Icon(Icons.star, color: Colors.green[500]),
                        Icon(Icons.star, color: Colors.black),
                        Icon(Icons.star, color: Colors.black),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(children: [
                        Icon(Icons.kitchen, color: Colors.green[500]),
                        Text("icone"),
                        Text("icone")
                      ]),
                      Column(children: [
                        Icon(Icons.timer, color: Colors.green[500]),
                        Text("icone"),
                        Text("icone")
                      ]),
                      Column(children: [
                        Icon(Icons.restaurant, color: Colors.green[500]),
                        Text("icone"),
                        Text("icone")
                      ]),
                    ]),
              ],
            )),
      ),
    );
  }
}
