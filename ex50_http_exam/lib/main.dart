// ignore_for_file: unused_local_variable

import 'dart:convert';    //utf8.decode
import 'package:flutter/material.dart'; 
import 'package:http/http.dart' as http;

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
      home: const MyHomePage(title: 'ex50_http_exam'),
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
              // 레코드 조회
              child: const Text('Http (Get)',
                                style: TextStyle(fontSize: 24)),
              onPressed: (){
                _getRequest();
              },
            ),
            ElevatedButton(
              // 레코드 입력
               child: const Text('Http(Post)',
                                  style: TextStyle(fontSize: 24)), 
              onPressed: (){
                _postRequest();
              },
            ),
          ],
        ),
      ),
    );
  }

void _getRequest() async{
  // https://sample.bmaster.kro.kr/contacts  여기에서 숫자 하나 복사할 것
  var url = Uri.parse("https://sample.bmaster.kro.kr/contacts/1592030163198");  
  http.Response response = // json으로 가져와라 요청
  await http.get( 
    url,
    headers: {"Accept": "application/json"});
    // 접속 상태
    var statusCode = response.statusCode;
    // 응답헤더

    var responseHeaders = response.headers;
    // 요청 레코드 정보 json //responseHeaders 요청하는 것
    var responseBody = utf8.decode(response.bodyBytes); // for 한글

    print("statusCode: $statusCode");
    // print("responseHeaders: $responseHeaders");
    print("responseBody: $responseBody");
    }
    void _postRequest() async{
      var url =  Uri.parse("https://sample.bmaster.kro.kr/contacts");
      // 데이터를 입력해달라고 요청
    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type' : 'application/x-form-urlencoded'
      },
      body:{
        "name": "도라에몽 간식주머니",
        "tel": "010-1111-2222",
        "darress" : "서울시 종로구"
      },
    );
    var statusCode = response.statusCode;
    // var responseHeaders = response.headers;
    var responseBody = utf8.decode(response.bodyBytes);   // for 한글

    print("statusCode: $statusCode");
    // print("responseHeaders: $responseHeaders");
    print("responseBody: $responseBody");
  }
}