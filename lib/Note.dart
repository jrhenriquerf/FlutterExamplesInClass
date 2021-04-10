import 'package:flutter_examples/components/NotasWidget.dart';
import 'package:flutter_examples/components/Notas.dart';
import 'package:flutter_examples/repository/NotasRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:intl/intl.dart';

List<Notas> _notas = [
  new Notas("Teste", "Preciso fazer isso tal dia", "2019-02-02"),
  new Notas("Teste 2", "Preciso fazer isso tal dia 2", "2019-02-02"),
];

void main() => runApp(MyList());

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas',
      home: _Lista(),
    );
  }
}

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_Lista> {
  final title = 'Basic List';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => CadastroView(Notas.empty())));
                print(_notas.length);
                setState(() {});
              },
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
              future: NotasRepository.list(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: new Card(
                          child: NotasWidget(snapshot.data[index]),
                        ),
                        onTap: () {
                          _showMenuOption(context, snapshot.data[index]);
                        },
                      );
                    });
              }),
        ),
      ),
    );
  }

  void _showMenuOption(BuildContext context, nota) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 200,
            color: Colors.blue[200],
            child: Column(
              children: [
                _button("Editar", context, () async {
                  Navigator.pop(context);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastroView(nota)));
                  setState(() {});
                }),
                _button("Concluir", context, () {
                  NotasRepository.delete(nota.id);
                  setState(() {});
                  Navigator.pop(context);
                }),
                _button("Fechar", context, () {
                  Navigator.pop(context);
                })
              ],
            ),
          );
        });
  }

  Widget _button(title, context, function) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: FlatButton(
        color: Colors.red,
        child: Text(
          title,
          style: TextStyle(color: Colors.yellow, fontSize: 20.0),
        ),
        onPressed: function,
      ),
    );
  }
}

class NotesView extends StatelessWidget {
  final Notas _notas;

  NotesView(this._notas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notas"),
      ),
      body: Center(
        child: Column(
          children: [
            NotasWidget(this._notas),
            Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                        child: Text(
                            "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
          ],
        ),
      ),
    );
  }
}

class CadastroView extends StatelessWidget {
  final Notas nota;
  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final title = TextEditingController();
  final description = TextEditingController();
  final date = TextEditingController();

  CadastroView(this.nota);

  @override
  Widget build(BuildContext context) {
    title.text = nota.title;
    description.text = nota.description;
    date.text = nota.date;
    developer.log('log me 1', name: 'my.app.category 1');
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de nota"),
        ),
        body: Container(
          padding: new EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              TextField(
                controller: title,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Título",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                maxLines: 8,
                controller: description,
                obscureText: false,
                style: style,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    hintText: "Descrição",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  onDateTimeChanged: (DateTime newDateTime) {
                    var newDate = DateFormat('yyyy-MM-dd').format(newDateTime);
                    developer.log('log me', name: newDate.toString());
                  },
                ),
              ),
              RaisedButton(
                child: Text("Salvar nota"),
                onPressed: () {
                  nota.title = title.text;
                  nota.date = date.text;
                  nota.description = description.text;

                  if (nota.id == null) {
                    NotasRepository.save(nota);
                  } else {
                    NotasRepository.update(nota);
                  }
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                textColor: Colors.yellow,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                splashColor: Colors.grey,
              ),
            ],
          ),
        ));
  }
}
