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
      home: const MyHomePage(title: 'ex24 timepicker'),
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
   TimeOfDay _selectedTime = TimeOfDay.now();
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
            Text(
              '${_selectedTime.hour}:${_selectedTime.minute}',
              style: TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              child: const Text('Show DatePicker',
                                style: TextStyle(fontSize: 24)),
              onPressed: ()=> selectTime(), 
            ),
          ],
        ),
      ),
    );
  }
  Future selectTime() async{
    TimeOfDay? picked = await showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now(),
      // ### ----------------------------------------------------
      builder: (BuildContext context, Widget? child){
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
            // ### change the border color ###
            primary: Colors.pink,
            // ### change the text color ###
            onSurface: Colors.pink
            ),
            // ### button colors ###
            // buttonTheme: ButtonThemeData(
            //   colorScheme: ColorScheme.light(
            //     primary: Colors.green
            //   ),
            // ),
          ),
          child: child!
          );
      },
      // ### --------------------------------------------------
    );
    if(picked != null){
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}