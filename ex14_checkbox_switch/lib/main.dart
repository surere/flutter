import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ex14 checkbox_switch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   bool _chk1 = false;
   bool? _chk2 = false;
   bool _chk3 = false;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Checkbox(
             value: _chk1,    // 체크박스에서 사용할 값 지정
             // 체크 or 언체크시 이벤트 처리
             // 위에서 bool 처리 했기때문에 이곳에서는 bool?
             onChanged: (bool? value){
              setState(() {
                _chk1 = value!;
              });
              print('Checkbox1 : $_chk1');
             }),

             Checkbox(
             value: _chk2,
             checkColor: Colors.pink,
             activeColor: Colors.green,
             onChanged: (value){
              setState(() {
                _chk2 = value;
              });
              print('Checkbox2 : $_chk2');
             }),
             Switch(
              value: _chk3,
              activeColor: Colors.red,
              activeTrackColor: Colors.cyan,
              inactiveThumbColor: Colors.lightGreen,
              inactiveTrackColor: Colors.lightGreenAccent,
               onChanged: (value){
                setState(() {
                  _chk3 = value;
                });
                print('Switch : $_chk3');
               
              }
            ),
          ],
        ),
      ),
    );
  }
}