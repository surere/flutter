import 'package:ex43_tabbar/page_a1.dart';
import 'package:ex43_tabbar/page_b1.dart';
import 'package:ex43_tabbar/page_c1.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
       primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
       home: const MyHomePage(title: '',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // const MyHomePage ({super.key});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// 작업할 공간
class _MyHomePageState extends State<MyHomePage> {
// 
  late PersistentTabController _controller;

  @override
  void initState(){
    super.initState();
    // 컨트롤러 객체 생성 및 첫 페이지 설정
    _controller = PersistentTabController(initialIndex: 0);
  }   

  @override
  Widget build(BuildContext context) {
   
    return PersistentTabView(
      context,
      controller: _controller,    // 컨트롤러
      screens: _bulidScreens(),   // 탭바를 눌렀을 때 변경될 페이지 설정
      items: _navBarsItems(),   // 네비바 아이템 설정
      confineInSafeArea: true,    // 네비바를 안전 영역에 둔다.
        backgroundColor: Colors.deepPurple.shade100,  //Default is Colors.white
        handleAndroidBackButtonPress: true,   
        // 키보드가 나타날때 화면을 위로 이동하는 경우 이 조건이 충족되어야 한다. 
        resizeToAvoidBottomInset: true,
        stateManagement: true,    // 각 화면 상태 유지
        // '크기조정'을 설정하는 것이 좋습니다. 하단을 피하려면 이 인수를 사용할때
        // INSET이 True로 표시됩니다.
        hideNavigationBarWhenKeyboardShows: true,

        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        // 네비바의 버튼을 눌렀을 때 전환 효과
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        // 화면 전환시의 애니메이션 효과
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: false,  // false 이면 비활성화
          curve: Curves.ease,
          duration: Duration(milliseconds: 500),
        ),
        navBarStyle: NavBarStyle.style7,  // https//https://pub.dev/packages/persistent_bottom_nav_bar
    );
  }
  // 탭바를 클릭했을 때 처리될 페이지 선언
  List<Widget> _bulidScreens(){
    return[
      const PageA1(),
      const PageB1(),
      const PageC1(),
    ];
  }
  // 탭메뉴의 버튼 생성 및 설정
  List<PersistentBottomNavBarItem> _navBarsItems(){
    return[
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home), // 아이콘 설정 
        title: "Home",  // 텍스트 설정
        activeColorPrimary: Colors.blue,  // 기본색깔
        activeColorSecondary: Colors.yellow,  // 반전 되었을 때 색깔
        inactiveColorPrimary: Colors.grey,    // 비활성화 상태의 색깔
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search), // 아이콘 설정
        title: "search",    // 텍스트 설정
        activeColorPrimary: Colors.blue,    // 기본색깔
        activeColorSecondary: Colors.red, // 반전 되었을 때 색깔
        inactiveColorPrimary: Colors.grey, // 비활성화 상태의 색깔
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add),
        title: "add",
        activeColorPrimary: Colors.blue,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
      