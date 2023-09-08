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
        // 시각적인 밀도 
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // ListTile 클릭시 리플 효과 색상 변경
        splashColor: Colors.red,
        // 불투명한 색상보다 스플래시 효과를 더 강조한다.(선택되었을때 전체색)
        highlightColor: Colors.black.withOpacity(.5),
      ),
      home: const MyHomePage(title: 'ex26 listview1_deco'),
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
   
  var _checkboxValue = false;
  var _radioValue = 0;
  var _switchValue = false; 
  //블리언타입 정수

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        // 1. 명시적으로 children으로 List를 넘겨서 생성
        children: getMyList(),
          ),
        );
      }
      List<Widget> getMyList(){
        List<Widget> myList = [
          Container(
            // width: double.infinity, // like Match_parent in Android / 부모크기에 맞추기
            height: 100,
            alignment: Alignment.center,

            color: Colors.amber[600],
            child: Text('onTab 이 없어 클릭 안됨', style: TextStyle(fontSize: 30)),
          ),

          ListTile(
            title: Text('Basic #1'),
            subtitle: Text('타이틀과 서브 타이틀로만 구성'),
            trailing: Icon(Icons.more_vert),
            onTap: (){
              print('Basic #1');
            },
          ),
          Divider(
            color: Colors.black,
            height: 5,
            // indent: 10,    // 들여쓰기
            // endIndent: 10,
          ),

          ListTile(
            leading: FlutterLogo(   // 좌측
              size:50.0,
            ),
            title: Text('Basic #2'),
            trailing: Icon(Icons.autorenew),    // 우측
            onTap: (){
              print('Basic #2');
            },
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),
          
          ListTile(
            leading: Icon(
              Icons.account_box,
              size:50.0,
            ),
            title: Text('Basic #3'),
            subtitle: Text('기본형의 모든 요소 사용'),
            trailing: Icon(Icons.arrow_back_ios),
            onTap: (){
              print('Basic #3');
            },
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),

          ListTile(
            leading: Icon(
              Icons.account_box,
              size:50.0,
            ),
            title: Text('Basic #3 - isThreeLine: false'),
            subtitle: Text('내용이 길면 다음 줄로 내용이 넘어간다. 그러나 공간이 확정'),
            trailing: Icon(Icons.arrow_back_ios),
            onTap: (){
              print('Basic #3 - isThreeLine: false');
            },
            // false는 칸이 가로로 세개의 칸이 나눠져 있다면 true는 세개의 칸으로 가운데 칸에 위아래
            // 칸이 나눠진 두개의 칸이 또 있다.
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),

          ListTile(
            leading: Icon(
              Icons.account_box,
              size:50.0,
            ),
            title: Text('Basic #3 - isThreeLine: true'),
            subtitle: Text('내용이 길면 다음 줄로 내용이 넘어간다. 공간도 같이 한 줄'),
            isThreeLine: true,
            trailing: Icon(Icons.arrow_back_ios),
            onTap: (){
              print('Basic #3 - isThreeLine: true');
            },
          ),
          Divider(
            color: Colors.black,
            height: 5,
          ),

          CheckboxListTile(
            value: _checkboxValue, 
            title: Text('CheckBox ListTile'),
            // 삼항 연산자
            secondary:  _checkboxValue ? Icon(Icons.thumb_up) : Icon(Icons.thumb_down),
            onChanged: (bool? value){
              setState(() {
                _checkboxValue = value!;
              });
              print('CheckBox ListTile');
            },
          ),
          const Divider(
            color: Colors.black,
            height: 5,
          ),

          RadioListTile(
            title: Text('GOOD'),
            groupValue: _radioValue,
            value: 1,
            selected: true,
            onChanged: (int?value){
              setState(() {
                _radioValue = value!;
              });
            },
          ),
          
          RadioListTile(
            title: Text('NOT GOOD'),
            groupValue: _radioValue,
            value: 2,
            selected: true,
            onChanged: (int?value){
              setState(() {
                _radioValue = value!;
              });
            },
          ),
          const Divider(
            color: Colors.black,
            height: 5,
          ),

          SwitchListTile(
            title: Text('Switch ListTile'),
            subtitle: Text(_switchValue?'on':'off'),    // 삼항 연산자 - 참이면 on 거짓이면 off_switchValue?'on':'off'
            value: _switchValue,
            onChanged: (bool value){
              setState(() {
                _switchValue = value;
              });
              print('Switch ListTile');
            },
            secondary: Icon(Icons.lightbulb_outline),
            
          ),
            
          // 클릭시 리플 효과 표시 됨 (Card -> ListTile)
          Card(
            color: Colors.amber[100],
            elevation: 0,
            shape: RoundedRectangleBorder(    // 모서리가 둥근 직사각형 테두리
              side: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5), // 숫자 준 값만큼 둥근 테두리 값을 줌
            ),
            child: ListTile(
              // contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              leading: const Icon(
                Icons.account_box,
                size: 50.0,
              ),

              title: const Text(
                'Card -> ListTile',
                style: TextStyle(fontSize: 18, color: Colors.blue),
              ),
               subtitle: const Text('클릭시 리플 효과 표시 됨'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: (){
              print('fff');
             },
            ),
          ),
          
        // =============================================================================
        // 클릭시 리플 효과 표시됨 (Card -> InkWell)
        Card(
          color: Colors.amber[100],
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(5)
        ),
        child: InkWell(
          splashColor: Colors.blue,  // 스플래쉬색을 여기서 지정할 수 있음
          onTap: (){
            print('ggg');
          },
          child: const Row(
            children: [
              SizedBox(
                width: 100,
                height: 150,    // card 높이가 자식높이로 됨
                child: Icon(

                  Icons.account_box,
                  size: 50.0,
                ),
              ),
              /*
                차지해야하는 공간보다 더 공간을 차지하게 하고 싶다면
                Flexible로 감싸주면 된다.
              */
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "location",
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                    ),
                    ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Poplation: 22/ 06/ 2020',
                        style: TextStyle(
                          fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.data_usage),
                        ),
                      ],
                    ),
                  ],
                ),
               ),   
              ],
            ),
          ),
        ),
      ];
    return myList;
  }
}