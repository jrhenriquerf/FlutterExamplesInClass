import 'package:flutter/material.dart';

class CardMoney extends StatelessWidget {
  dynamic data;
  final valorReal;

  CardMoney(this.data, this.valorReal);

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Card(
          child: Column(children: <Widget>[
            ListTile(
              leading: ImageIcon(
                  AssetImage("assets/images/${this.data["name"]}.png"),
                  size: 50),
              title: Text("Moeda: ${this.data["name"]}"),
              subtitle: Column(
                children: [
                  Text("Valor Venda: " +
                      ((this.data["buy"] == null
                              ? 0
                              : this.data["buy"] * this.valorReal)
                          .toString())),
                  Text("Valor Compra: " +
                      ((this.data["sell"] == null
                              ? 0
                              : this.data["sell"] * this.valorReal)
                          .toString())),
                  Text("Variação: " +
                      ((this.data["variation"] * this.valorReal).toString()))
                ],
              ),
            ),
          ]),
        ));
  }
}
