import 'package:flutter_examples/components/Notas.dart';
import 'package:flutter/material.dart';

class NotasWidget extends StatelessWidget {
  final Notas nota;

  NotasWidget(this.nota);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Center(
        child: Row(
            //geral
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                //Brasil
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(this.nota.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(this.nota.description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ],
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              // Column(
              //     //Alemanha
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Text(this.nota.date,
              //           textAlign: TextAlign.center,
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 20)),
              //     ]),
            ]),
      ),
    );
  }
}
