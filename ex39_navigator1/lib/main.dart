import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 개발자가 직접 정의한 Page 1클래스를 사용함
      home: const Page1(),
    );
  }
}
// stful 단축키를 통해 자동완성
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    print('Page1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2페이지 추가',
                                style: TextStyle(fontSize: 24)),
              onPressed: (){
                // 스택에 페이지 추가
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _page2State();
}

class _page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    print('Page2');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('3페이지 추가',
                                style: TextStyle(fontSize: 24)),
              onPressed: (){
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const Page3()),
                );
              },
            ),
    ElevatedButton(
     
      child: const Text('2페이지 제거',
                        style: TextStyle(fontSize: 24)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        // primary는 더이상 사용되지 않으므로 
        // 대신 backgroundColor를 사용합니다.
      ),
      onPressed: (){
        // 스텍에서 페이지 제거
        print('Page2-pop');
        Navigator.pop(context);
      },
       // 가독성을 높이기 위해 순서를 아래로 이동
    ),
          ],
        ),
      ),
    );
}
}

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _page3State();
}

class _page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
   print('Page3');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('3페이지 제거',
                                style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
              
        backgroundColor: Colors.orange,
      ),
      onPressed: (){
        print('Page3-pop');
        Navigator.pop(context);
      },
    ),
          ],
        ),
      ),
    );
}
}