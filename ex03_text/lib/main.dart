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
      home: const MyHomePage(title: 'Ex03 Text'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

 

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// 우리가 작업할 공간
class _MyHomePageState extends State<MyHomePage> {
   
  @override
  Widget build(BuildContext context) {
   // 텍스트 스타일을 변수로 선언한 후 위젯에 적용한다.
  var myTextStyle1 = TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      height: 1.5,
      color: Colors.red.withOpacity(0.8),

    );
  


    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      // body: Center( 

        // body: const Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: <Widget>[
        //       Text(
        //         '홍길동',
        //         style: TextStyle(
        //           fontSize: 30,
        //         ),
        //       ),
        //       Text(
        //         '전우치',
        //         style: TextStyle(
        //           fontSize: 30,
        //         ),
        //       )
        //     ]
        //   ),
        // ),
              
        // 위젯의 배치를 수직 방향으로 설정한다.
        // 가로로 설정 할때는 Row를 사용한다. //Row
        body: Column(
          // 위젯을 2개 이상 배치하기 위해 사용하는 속성
          // 주로 배열형태로 기술함.
          children: <Widget>[
            /*
              텍스트를 표현하기 위한 위젯
              Text(출력내용, 스타일)
            */
            // Text 선택한 후 ctrl + .누르면 메뉴가 나옴 그중에 컬럼을
            // 선택해서 추가할 것. center은 똑같이 선택한 후
            // remove해서 지울것.
            const Text(
              '0123456789Aa가#',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.orange, 
                fontFamily: "D2Coding",
                letterSpacing:4.0,  // 자간
              ),
            ),
            const Text(
              '0123456789Aa가#',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,   // 미리 정해진 상수값 사용 // 미리 정해진 상수값을 사용하기 때문에 const를 사용할 수 있던 것
                fontStyle: FontStyle.italic,
                color: Color(0xFF000000),
              ),
            ),
            // withOpacity 사용시 const와 충돌이 //되기 때문에 상수와 충돌
            Text(
                '0123456789Aa가#',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w500,  // w500은 굵기를 말하는 것 굵기가 미디움 사이즈 정도
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              '0123456789Aa가#',    // 정렬
              textAlign: TextAlign.left,
              style: myTextStyle1, // 앞에서 변수로 선언한 스타일 적용 // 또 바뀔 수 있기 때문에 상수선언을 할 수 없어서 const를 사용할 수 없음
              // 스타일을 마치 함수처럼 적용
              // const는 각각 해줘야 하기 때문에 body에 사용을 해주면 안된다 그러면 전체 const가 적용되기 때문에 상수설정은 나중에 각각 설정해주는 것이 좋다.
              // 파란줄을 깔끔하게 정리하기 위해서(오류가 아님) const로 보기 편하게 선언해 주는 것
                
            ),
          ],
        ),
      );
  }
}