import 'package:ex41_navigator3/page2.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable 노란색으로 뜨는 것은 주석을 달면 사라짐
class Page3 extends StatefulWidget{
  String data = '';
  Page3({super.key, required this.data});

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
            const SizedBox(height: 20,),
            ElevatedButton(
              child: const Text('2페이지로 변경', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                // 화면 전환시 파라미터 전달
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2)=> Page2(
                      data: '3페이지에서 보냄 (Replacement)',
                    ),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              },
            ),
            Text(widget.data, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}