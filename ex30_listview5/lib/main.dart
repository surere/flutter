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
      home: const MyHomePage(title: 'ex30 listview5'),
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
  // 리스트 컬렉션 생성
   late List<Person> persons;

   @override
    void initState(){
      super.initState();

      persons= [];
      for(int i=0; i<15; i++){
        persons.add(Person(i+21, '홍길동$i', true));
      }
    }
  @override
  Widget build(BuildContext context) {
  //  외부에서 가져오는 것을 동적
  //  정적은 직접입력
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.all(0.0),
        padding: const EdgeInsets.all(0.0),
        // width: 250,   // 크기를 지정하지 않으면 자식의 크기
        // height: 250,  // 크기를 지정하지 않으면 자식의 크기
                      // 화면 크기보다 자식이 크면 화면의 크기
        child: ListView(  // 세로 화면 
          children: <Widget>[
            Container(
              width: double.infinity,   // like Match_parent in Android
              height: 200,
              alignment: Alignment.center,
              color: Colors.amber[700],
              child: const Text('Entry A', style: TextStyle(fontSize: 30)),
            ),
            // 2. ListView.builder를 사용해서 생성,
            SizedBox(
              width: double.infinity,
              height: 200,
              // 빌더를 통해 가로형 리스트뷰를 출력
              child: ListView.builder(
                // 스크롤방향을 수평방향으로 설정
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(8),
                itemCount: persons.length, // 리스트뷰의 타일 갯수
                // itemCount: persons.length,
                itemBuilder: (BuildContext context, int index){
                  return PersonTile(persons[index], index);
                }
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                color: Colors.amber[500],
                child: const Text('Entry b', style: TextStyle(fontSize: 30)),
              ),
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                color: Colors.amber[300],
                child: const Text('Entry c', style: TextStyle(fontSize: 30)),
              ),
              Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                color: Colors.amber[100],
                child: const Text('Entry d', style: TextStyle(fontSize: 30)),
              ),
          ],
        ),
      ),
    );
  }
}

// 데이터로 사용할 클래스 ============================================
class Person{
    int age;
    String name;
    bool isLeftHand;

    Person(this.age, this.name, this.isLeftHand);
  }

  // PersonTile 정의 =========================================================
  class PersonTile extends StatelessWidget{ 
    final Person _person;
    final int index;

    PersonTile(this._person, this.index);

    @override
    Widget build(BuildContext context){
      return Card(
        color: Colors.amber[100],
        elevation: 0,
        shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(0),
        ),
        child: InkWell(
          splashColor: Colors.blue,
          onTap: (){
            print('$index번 타일 클릭됨');
           },
           child: SizedBox(
            width: 140,
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,    // like Match_parent in Android
                  height: 100,
                  alignment: Alignment.center,
                  color: Colors.blue[50],
                  child: Column(
                    children: [
                      Text(
                        _person.name,
                        style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text(
                        "'${_person.age}세'",
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                // 각 타일별 존재하는 버튼
                ElevatedButton(
                  child: const Text('ElevatedButton',
                                    style: TextStyle(fontSize: 14)),
                  onPressed: () => _onClick(index), 
                ),
              ],
            ),
           ),
        ),
      ); 
    }
    void _onClick(int index) {
      print('$index 클릭됨');
    }   
  }
  