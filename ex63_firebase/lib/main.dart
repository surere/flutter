import 'package:firebase_core/firebase_core.dart';
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
      home: const MyHomePage(title: 'ex63_firebase'),
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
   String name = '';


  FirebaseOptions get firebaseOptions => const FirebaseOptions(
        appId: "1:30700737104:android:8f5b6716f8be190b4f7755",
        // google-service.json 파일 안에 있음
        apiKey: 'AIzaSyD8p5YbCU0I2Eb5Mi79LL0emWN5dPaqp_E',
        projectId: 'flutter-exam-74880',
        messagingSenderId: '30700737104', // 프로젝트 번호
      );
  Future<void> initializeDefault() async{
    FirebaseApp app = await Firebase.initializeApp();
    name = app.name;
    print('Initialized default app $app');
  }

   Future<void> initializeSecodary() async{
    name = 'myFcm';
    FirebaseApp app = await Firebase.initializeApp(
                              name: name,
                              options: firebaseOptions);

    print('Initialized $app');
  }

  // 현재는 하나이지만 여러개를 사용할 경우 : FCM, Storage, Auth...
  void apps(){
    final List<FirebaseApp> apps = Firebase.apps;
    print('Currently initialized apps: $apps');
  }
  void options(){
    final FirebaseApp app = Firebase.app(name);
    final FirebaseOptions? options = app.options;
    print('Current option for app $name: $options');
  }

  Future<void> delete() async{
    final FirebaseApp app = Firebase.app(name);
    // await app.delete();
    print('App $name deleted');
  }

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
          children: [
            ElevatedButton(
               child: const Text('Initialize default app'),
              onPressed: initializeDefault,
            ),
             ElevatedButton(
               child: const Text('Initialize secondary app'),
              onPressed: initializeSecodary,
            ),
             ElevatedButton(
               child: const Text('Get apps'),
              onPressed: apps,
            ),
             ElevatedButton(
               child: const Text('List options'),
              onPressed: options,
            ),
          ],
        ),
      ),
    );
  }
}