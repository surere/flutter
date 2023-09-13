import 'package:flutter/material.dart';

// ignore: must_be_immutable 
class Page3 extends StatefulWidget{
  String data = '';
  Page3({Key? key, required this.data}) : super(key: key);
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3>{
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Page3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              onPressed: (){
                Navigator.pop(context, '3페이지에서 보냄(pop)'); 
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}