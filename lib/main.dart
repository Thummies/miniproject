import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '2.dart';

Calculation calculation = Calculation();

void main()=>runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text("Counter"),
    ),
    body: const Counter(),
  ),
));

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$count",
          style: const TextStyle(
          fontSize: 40,
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton.extended(onPressed:(){
              Alert(
                context: context,
                type: AlertType.success,
                title: "Counter has been reset.",
                buttons: [
                  DialogButton(
                    child: const Text(
                      "OK",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => Navigator.pop(context),
                    width: 120,
                  )
                ],
              ).show();
              setState(() {
                count=0;
              });
            },
              label: const Text("Reset"),
              icon: const Icon(Icons.refresh),),
            FloatingActionButton.extended(onPressed:(){
              setState(() {
                calculation.minus(count);
                if (count==0) {}
                else {count=count-1;}
              });
            },
              label: const Text("Minus"),
              icon: const Icon(Icons.exposure_neg_1_outlined),),
            FloatingActionButton.extended(onPressed:(){
              setState(() {
                calculation.plus(count);
                count=count+1;
              });
            },
              label: const Text("Plus"),
              icon: const Icon(Icons.exposure_plus_1_outlined),)
          ],
        )
      ],
    );
  }
}


