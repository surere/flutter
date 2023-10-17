import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_lecture/screen/home_screen.dart';
import 'package:netflix_clone_lecture/screen/like_screen.dart';
import 'package:netflix_clone_lecture/screen/more_screen.dart';
import 'package:netflix_clone_lecture/screen/search_screen.dart';
import 'package:netflix_clone_lecture/widget/bottom_bar.dart';

// late Firebase fbApp;

// void main() async{  // 데이터 불러오기 async
  Future main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDefault();
  print('Initialized defult app& fbApp');
  runApp(const MyApp());
}

Future<void>initializeDefault() async{
  FirebaseApp app = await Firebase.initializeApp();
  print('initialized default app$app');
}

class MyApp extends StatefulWidget { // StatelessWidget 상태변경 위젯은 사용하지 않겠다
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late TabController controller; // late 함수 선언 controller
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bbongflix',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        hintColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(), // 상수선언
            children: <Widget>[
            HomeScreen(),
              SearchScreen(),
              LikeScreen(),
               MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}