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
      home: const MyHomePage(title: 'ex37 bottomnavigationbar'),
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
   int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        child: getPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange[200],   // 배경색
        iconSize: 30,   // 아이콘 크기
        selectedItemColor: Colors.black,    // 선택했을 때 색깔
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedItemColor: Colors.white,  // 선택되지 않았을 때 색깔
        unselectedLabelStyle: const TextStyle(fontSize: 14),
        currentIndex: _curIndex,    // 인덱스 설정
        onTap: (index){
          // print("선택한메뉴:$index");  // 로그용
          setState(() {
            // 콜백된 인덱스를 통해 전역변수의 값 변경
            _curIndex = index;
          });
        },

        // 각 메뉴 구성
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.home), // 아이콘과 텍스트 설정
          label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search),
          label: 'search'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings),
          label: 'settings'
          )
        ],
      ),
    );
  }
  // 각 페이지를 인덱스를 통해 반환한다.
  Widget getPage(){
    Widget? page;   // null safety 적용
      switch (_curIndex){
      case 0:
      page = Page1();
      break;
      case 1:
        page = Page2();
      break;
      case 2:
        page = Page3();
      break;
      }
      return page!;   // null check operation(실행시 null이면 런타임에러 발생됨)
  }
  Widget Page1(){
  return Container(
    height: 200,
    child: const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            color: Colors.red,
            size: 50.0,
          ),
          Text(
            'page index : 0',
            style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
  Widget Page2(){
  return Container(
    height: 200,
    child: const Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.add_circle,
        color: Colors.orange,
        size: 50.0,
        ),
      Text(
            'page index : 1',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    ),
  );
  }
  Widget Page3(){
  return Container(
    height: 200,
    child: const Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
      Icons.notifications,
        color: Colors.blue,
        size: 50.0,
        ),
      Text(
        'page index : 2',
        style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
} 
