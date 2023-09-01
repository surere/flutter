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
      home: const MyHomePage(title: 'Ex04 icon'),
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
      body: const Row(    // 아이콘은 상수이기 때문에 아래 모두 상수 처리하지 말고 
                          // 여기서 상수 처리하면 됨.
        children: <Widget>[ // 우리가 만들고 자동으로 완성된 코드에는 앞에 있는 <Widget>이 없다.
                            // 없어도 된다는 뜻. 생략 가능.
          Icon(
           Icons.camera_alt,
           color: Colors.pink,
           size: 35.0,
          ),
          Icon(
           Icons.cancel,
           color: Colors.orange,
           size: 35.0,
          ),
          Icon(
           Icons.account_circle,
           color: Colors.blue,
           size: 35.0,
          ),
           Icon(
           Icons.announcement,
           color: Colors.red,
           size: 35.0,
          ),
            Icon(
           Icons.attach_file,
           color: Colors.grey,
           size: 35.0,
          ),
            Icon(
           Icons.autorenew,
           color: Colors.black,
           size: 35.0,
          ),
           Icon(
           Icons.border_color_rounded,
           color: Color.fromARGB(255, 132, 98, 224),
           size: 35.0,
          ),
            Icon(
           Icons.home,
           color: Color.fromARGB(255, 4, 150, 9),
           size: 35.0,
          ),
            Icon(
           Icons.search,
           color: Color.fromARGB(255, 86, 13, 255),
           size: 35.0,
          ),
             Icon(
           Icons.settings_applications_sharp,
           color: Color.fromARGB(255, 86, 13, 255),
           size: 35.0,
          ),
             Icon(
           Icons.perm_media_outlined,
           color: Color.fromARGB(255, 163, 38, 96),
           size: 35.0,
          ),
        ],
      ),
    );
  }
}