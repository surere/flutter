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
      home: const MyHomePage(title: 'ex21 alert dialog'),
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
   String _sPersonName='';  // 이름을 받을 변수 
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
            ElevatedButton(
              child: const Text('Show AlertDialog',
              style: TextStyle(fontSize: 24)),
              onPressed:() => _showAlertDialog(context, 'hello~'),
            
            ),
          ],
        ),
      ),
    );
  }

  // void showAlertDialog() async{  // 여기에 반드시 Future가 있어야 한다.
    Future _showAlertDialog(BuildContext context, String message) async{
      await showDialog( // 동작이 끝나지 않으면 실행이 멈추지 않음. ex. 지도에서 맛집을 검색하지 않으면
      // await상태 / 지도에 맛집을 검색 엔터를 쳤을 때 await가 끝난 상태
      // 즉 show AlertDialog를 눌렀을 때 await 상태가 되고 그 창이 끝날때까진 끝나지 않은 상태.
        context: context, 
        /*
          화면의 빈곳을 눌러도 창이 닫히지 않음
          true인 경우에는 창이 닫히게 된다.
        */
        barrierDismissible: false,
        builder: (BuildContext context){
          return Theme(
            // 배경색 - 눌렀을때 오렌지 색으로 뜸
            data: ThemeData(dialogBackgroundColor: Colors.orange),
            child:AlertDialog(
              // 모서리 부분을 라운딩 처리
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
              title: const Text('AlertDialog Example'),
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Text(message),    // 전달받은 메세지 출력
                    TextField(
                    autofocus: true,
                    // 입력 상자의 힌트 설정
                    decoration: const InputDecoration(
                      labelText: 'Name', hintText: '홍길동'),
                      // 입력된 내용을 전역변수에 저장
                      onChanged: (value){
                      _sPersonName = value;
                    },
                  ),  
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                child: const Text('OK'),
                onPressed: (){
                  // 버튼을 누르면 대화창을 닫음
                  Navigator.pop(context, 'OK');
                  // 입력된 내용을 콘솔에 출력.
                  print('OK - $_sPersonName');
                } ,
              ),
              ElevatedButton( // cancel부분
                child: const Text('Cancel'),
                onPressed: (){
                  // 버튼을 누르면 대화창을 닫음
                  Navigator.pop(context, 'Cancel');
                  print('Cancel');
                },
              ), 
            ],
          ),
        );
      },
    );
  }
}