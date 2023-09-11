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
      home: const MyHomePage(title: 'ex27_listview2'),
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
  // 나중에 초기화 될것임을 명시함. 데이터로 사용할 컬렉션
   late List<Person> persons;

// 위젯 초기화시 딱 한번만 호출되는 함수로 변경했을 때 Hot reload가
// 지원되지 않으므로 재시작해야 한다.
   @override
    void initState(){
      super.initState();    // must call in 2.0~

    persons= [];// 초기화
    // 데이터로 사용하기 위한 반복

      for(int i=0; i<15; i++){
        persons.add(Person(i+21, '홍길동$i', true));
      }
    }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: 
      
      // 1. 명시적으로 children으로 List를 넘겨서 생성
      // ListView(
      //  padding: const EdgeInsets.all(8),
      //   children: getMyList(),
      // )

      // 2. ListView.builder를 사용해서 Lazy 하게 생성
      // index를 이용하여 플러터가 알아서 필요한만큼 리스트를 생성한다.

      ListView.builder(
        padding: const EdgeInsets.all(8),
        // 컬렉션에 저장된 아이템의 갯수만큼 알아서 반복된다.
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index){
          // 리스트뷰의 아이템을 갯수만큼 생성해서 반환한다.
          return PersonTile(persons[index]);
        },
            ),
    );
         
  }
}  
// 데이터로 사용할 클래스 ====================================================
  class Person{
    int age;
    String name;
    bool isLeftHand;

    Person(this.age, this.name, this.isLeftHand);
  }

// PersonTile 정의 =========================================================

/*
	StatelessWidget 클래스는 build()매서드를 가지고 있다. build()매서드는
	위젯을 생성할 때 호출되는데, 실제로 화면에 그릴 위젯을 작성해 반환 합니다.
	따라서 StatelessWidget클래스를 상속받으 PersonTile클래스는
	ListTile클래스의 인스턴스를 작성해 반환한다.
*/
  class PersonTile extends StatelessWidget{ // 초반에 동적이었다가 정적으로 되는 것// ful은 메세지 알림 동적으로 움직임
  // 멤버변수와 생성자 정의
    final Person _person;
    // 필수 매개변수, {선택형 매개변수}

    PersonTile(this._person);

 @override
    Widget build(BuildContext context){
      return ListTile(
        leading: Icon(Icons.person),
        title: Text(_person.name),
        subtitle: Text("${_person.age}세"),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
          print(_person.name);
        },
      );
    }

}