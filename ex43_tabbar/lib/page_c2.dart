import 'package:flutter/material.dart';

class PageC2 extends StatefulWidget{
  const PageC2({Key? key}) : super(key: key);

  @override
  _PageC2State createState() => _PageC2State();
}
class _PageC2State extends State<PageC2>{
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page C-2'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Page C-2', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 30,),
            ElevatedButton(
               child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
               // 버튼 1을 누르면... 비동기로 동작한다.
              onPressed: () {
               Navigator.pop(context,);
              },
            ),
          ],
        ),
      ),
    );
   }
}