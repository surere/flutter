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
      home: const MyHomePage(title: 'ex16 togglebutton'),
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
  // 토글버튼에서 사용할 리스트 
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
   
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
            // 여러개 선택 가능한 토글
           const Text(
              'multi-select', textScaleFactor: 2),
              ToggleButtons(
                // 이벤트 리스너 : 누른 버튼의 인덱스가 매개변수로 전달됨.
                onPressed: (int index){
                  setState(() {
                    // !가 변수 앞에 있으므로 Not연산자임(주의) *중요
                    isSelected1[index] = !isSelected1[index];
                    print('isSelected1 : $isSelected1');
                    print('index : $index');
                  });
                },
                // 각 버튼의 값으로 사용할 List설정
                isSelected: isSelected1,
                // 각 버튼의 아이콘을 설정
                children: const[
                  Icon(Icons.ac_unit),
                  Icon(Icons.call),
                  Icon(Icons.cake),
                ],
            ),
            const SizedBox(height: 20),
            // single select // 한개만 선택 가능한 토글
            const Text('single select', textScaleFactor: 2),
            ToggleButtons(
              onPressed: (int index){ //클릭때문에 사용하는것
                setState(() { //화면을 변경해주기 위해서 사용 / 하나의 객체가 하나의 라이브러리 역할을 함
                  // 항목중 하나만 선택할 수 있도록 for문으로 처리
                  for (var i = 0; i < isSelected2.length; i++){
                    if(i == index){
                      // 선택한 항목만 활성화
                      isSelected2[i] =true;
                    }else{
                      // 반복에 의해 나머지는 비활성화
                      isSelected2[i] = false;
                    } //3개니까 3번만 반복 / 결과 화면을 보여줌 
                  }
                  print('isSelected2 : $isSelected2'); // 로그용 (프로그램아님) / 파란줄은 낭비하지말라는 확인해보라는 뜻
                });
              },
              isSelected: isSelected2,
              children: const[
                Icon(Icons.ac_unit),
                Icon(Icons.call),
                Icon(Icons.cake),
              ],
            ),
          ],
        ),
      ),
    );
  }
}