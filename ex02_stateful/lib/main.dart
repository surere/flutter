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
      home: const MyHomePage(title: 'Ex02 Stateful'),
    );
  }
}
// 상태가 없는 위젯 최초 한번만 빌드가 되고 변하지 않음
class MyHomePage extends StatefulWidget {   //상태 변화가 일부 있는
  const MyHomePage({super.key, required this.title});   // 변화가 없는

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();    // 변화가 있는
}
// 상태가 있는 스테이트풀 // 상태변화가 일부 있는 
// 변화가 있는 필요한 부분만 변화를 시키는
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String name = "홍길동";

  void _incrementCounter() {
    setState(() {   // 상태가 있는 애들을 다시 set해라. 한개라도 변하면 다시 다 그리라는 것.
    
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(    // 변화가 있는 부분은 여기에 그려짐/ 실질적인 화면
    // setstate되면 여기서 상태가 있는  애들은 다시 그려짐
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(   // 중앙에 맞추라는 뜻
       
        child: Column(  // 수직형
        
          mainAxisAlignment: MainAxisAlignment.center, // 수직형의 가운데
          children: <Widget>[
            const Text(   // 전체가 상수이므로 상태가 변경되지 않는 텍스트를 표현
              'You have pushed the button this many times:',
            ),
            Text(
              // '$_counter',
              // '$name'
              '이름: $name',    // 옵션이 있으서 변할 수 있다라는 표현
              // 테마가 변하면 여기도 변하기 때문에 여기는 상수 처리 안함. style이기 때문이 아님
                style: Theme.of(context).textTheme.headlineMedium,
                //테마를 가져다가 사용했는데 테마가 변하기 때문???
              
            ),
            Text(
              '홍길동1', // 변수선언한 값을 물어본 것 / 직접입력한 위 홍길동과 아래 홍길동은 다름
              // 옵션이 있어서 변할 수 있다라는 표현
              style: Theme.of(context).textTheme.headline4, // headline4(headlineMedium) 가운데 줄그어진 것 /곧 없어질수도 있으니 사용하지 말라는 뜻
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

// stful
