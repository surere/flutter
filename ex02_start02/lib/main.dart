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
      //    useMaterial3: true,
      ),
    //  home: const MyHomePage(title: 'Ex02 Start 02'),
    home : Scaffold(appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text('Example Title'),
      // const로 상수 정의하면 화면을 더이상 그리지 않음. const가 붙으면 상태가 없는 애
      // 즉 정보가 변하지 않는 애. 속도가 빨라짐.
      // 완성에서 알려주는 방법이 최선은 아님. (모바일은 초당 60프레입)이 나옴
      // 화면이 60번 깜박일때 까지 화면이 변하지 않은면 밧데리가 절약됨.
    ),
    body: const Center(
      child: Text('Example Body',
      style: TextStyle(fontSize:30),

      ),
    )
    ),
    );

  }
}


