import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'constants.dart';

String _output = '0';

void main() => runApp(
      MaterialApp(
        home: myapp(),
      ),
    );

class myapp extends StatefulWidget {

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {

  void initState(){
    super.initState();
    iconcolor=orange;
  }

  numbutton(String textchild, Color color) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: FlatButton(
        color: type == true ? Colors.white : Colors.black, //iconcolor
        child: Text(
          textchild,
          style: TextStyle(
            color: color,
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: () {
          buttonpressed(textchild);
        },
      ),
    );
  }

  String removeLastChar(String str) {
    return str.substring(0, str.length - 1);
  }

  buttonpressed(String textchild) {
    if (textchild == 'C') {
      output = '0';
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
      temp = '0';
      total = '';
      decimaladded=false;
    } else if (textchild == 'D') {
      if (_output != '0') {
        temp = removeLastChar(_output);
        _output = temp;
      }
      temp = removeLastChar(total);
      total = temp;
    } else if (textchild == '+' ||
        textchild == '-' ||
        textchild == '*' ||
        textchild == '/' ||
        textchild == '^') {
      num1 = double.parse(output);
      total = total + textchild;
      operand = textchild;
      _output = '0';
    } else if (textchild == '.') {
      if (_output.contains('.')) {
        return;
      } else {
        decimaladded=true;
        _output = _output + textchild;
        total = total + textchild;
      }
    } else if (textchild == '=') {
      num2 = double.parse(output);
      total = total + textchild;
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '/') {
        num1 % num2 != 0 ? decimaladded=true: decimaladded=false;
        _output = (num1 / num2).toString();
      }
      if (operand == '*') {
        _output = (num1 * num2).toString();
      }
      if (operand == '^') {
        _output = (math.pow(num1, num2)).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = _output + textchild;
      total = total + textchild;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(decimaladded==true?1:0);
      total;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: type == true ? Colors.transparent : Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              type == true ? Icons.brightness_2 : Icons.wb_sunny,
              color: type == true ? Colors.black : Colors.white,
            ),
            onPressed: () {
              setState(() {
                type = !type;
                numbercolor = type == true ? Colors.black : Colors.white;
                iconcolor = type == true ? orange : grey;
              });
            },
          ),
        ],
      ),
      backgroundColor: type == true ? Colors.white : Colors.black,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 80.0, right: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      output,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w400,
                        color: numbercolor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, right: 10),
                    alignment: Alignment.centerRight,
                    child: Text(
                      total,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w300,
                        color: numbercolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: numbutton('C', orange),
                          ),
                          Expanded(
                            child: numbutton('/', iconcolor),
                          ),
                          Expanded(
                            child: numbutton('^', iconcolor),
                          ),
                          Expanded(
                            child: Transform.rotate(
                              angle: 300 * math.pi / 100,
                              child: SizedBox(
                                height: double.infinity,
                                width: double.infinity,
                                child: FlatButton(
                                  color: type == true
                                      ? Colors.white
                                      : Colors.black, //iconcolor
                                  child: Icon(
                                    Icons.label,
                                    color: orange,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    buttonpressed('D');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: numbutton('7', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('8', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('9', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('*', iconcolor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: numbutton('4', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('5', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('6', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('-', iconcolor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: numbutton('1', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('2', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('3', numbercolor),
                          ),
                          Expanded(
                            child: numbutton('+', iconcolor),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: numbutton('0', numbercolor),
                          ),
                          Expanded(
                            flex: 1,
                            child: numbutton('.', numbercolor),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 70,
                              width: 70,
                              child: FloatingActionButton(
                                child: Icon(
                                  Icons.drag_handle,
                                  size: 30.0,
                                  color: type==true?Colors.white:orange,
                                ),
                                elevation: 0.0,
                                backgroundColor:
                                    type == true ? orange : Colors.black,
                                onPressed: () {
                                  buttonpressed('=');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*

buttonpressed(String textchild){
  if(textchild=='C'){

    output='0';
    _output ='0';
    num1=0.0;
    num2=0.0;
    operand='';
  }
  else if(textchild=='+'||textchild=='-'||textchild=='*'||textchild=='/'){
    num1=double.parse(output);
    operand=textchild;
    _output='0';
  }else if(textchild=='.'){
    if(_output.contains('.')){
      print('Already COntains a decimal');
      return;
    }else{
      _output=_output+textchild;
    }
  }else if(textchild=='='){
    num2=double.parse(output);

    if(operand=='+'){
      _output = (num1+num2).toString();
    }
    if(operand=='-'){
      _output = (num1-num2).toString();
    }
    if(operand=='/'){
      _output = (num1/num2).toString();
    }
    if(operand=='*'){
      _output = (num1*num2).toString();
    }
    num1=0.0;
    num2=0.0;
    operand='';
  }else{
    _output=_output+textchild;
  }
  print(_output);
}
*/

/*
class icon extends StatelessWidget {
  icon(this.icontype);
  final IconData icontype;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icontype,
      color:signcolor,
      size: 30.0,
    );
  }
}

Transform.rotate(
angle:300*math.pi/100,
child: SizedBox(
height: double.infinity,
width: double.infinity,
child: FlatButton(
color: Colors.white,      //iconcolor
child: icon(Icons.label),
onPressed: () {},
),
),
)
*/
