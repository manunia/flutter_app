import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new HomePage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  final _num1 = TextEditingController();
  final _num2 = TextEditingController();
  int result = 0;
  String input = "";
  bool _validate = false;

  @override
  void dispose() {
    _num1.dispose();
    _num2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Demo'),
      ),
      backgroundColor: Colors.white,
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(input),
              TextField(
                controller: _num1,
                decoration: InputDecoration(
                    labelText: "Enter first number",
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _num2,
                decoration: InputDecoration(
                  labelText: "Enter second number",
                  errorText: _validate ? 'Value Can\'t Be Empty' : null,),
                keyboardType: TextInputType.number,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    input = "";
                    _num1.text.isEmpty ? _validate = true : _validate = false;
                    _num2.text.isEmpty ? _validate = true : _validate = false;

                    result = int.parse(_num1.text) + int.parse(_num2.text);

                    input += _num1.text + '+' + _num2.text + ' = ' + result.toStringAsFixed(0);
                    _num1.clear();
                    _num2.clear();
                  });
                },
                child: Text('+'),
                textColor: Colors.white,
                color: Colors.blueAccent,
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    input = "";
                    _num1.text.isEmpty ? _validate = true : _validate = false;
                    _num2.text.isEmpty ? _validate = true : _validate = false;

                    result = int.parse(_num1.text) - int.parse(_num2.text);

                    input += _num1.text + '-' + _num2.text + ' = ' + result.toStringAsFixed(0);
                    _num1.clear();
                    _num2.clear();
                  });
                },
                child: Text('-'),
                textColor: Colors.white,
                color: Colors.blueAccent,
              )
            ],
          )),
    );
  }
}

