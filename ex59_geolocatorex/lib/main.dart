import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:permission_handler/permission_handler.dart';

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
      home: const MyHomePage(title: 'ex59_geolocatorex'),
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
  // 에러가 나면 인증키 다시 만들어서 할 것
   final String _apiKey = 'AIzaSyCXITOvpVr9OgrBFirhFvKiSb0pppyih0E';
   late  LocatitonGeocoder geocoder = LocatitonGeocoder(_apiKey);
   late Position _currentPosition;
   String _currentAddress = '';
   String lat = '';
   String lon = '';

   //
  _getCurrentLocation() async {
    await Permission.location.request().then((status){
      if(status == PermissionStatus.granted){
        Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best,
        // LocationAccuracy 옵션은 문서에 아이폰은 best안씀
                            forceAndroidLocationManager: false) // true:안드로이드 동작 x
        .then((Position position){
          _currentPosition = position;
          //  print(_currentPosition);
          setState(() {
            lat = '${position.latitude}';   // 위도 /latitude 라틴어?
            lon = '${position.longitude}';    // 경도 longitude
          });
        }).catchError((e){
          print(e);
        });
      }else{
        print('위치 서비스를 사용할 수 없습니다.');
      }
    });
  }
  //
  Future<void> _getAddressFromLatLng() async{
    final address = await geocoder.findAddressesFromCoordinates(
        Coordinates(_currentPosition.latitude,
                    _currentPosition.longitude));
    var message = address.first.addressLine;
    if (message == null) return;

    setState(() {
      _currentAddress = message;
    });
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
          children: <Widget>[
            Text("$lat $lon"),
            Text(_currentAddress),
            SizedBox(height: 10,),
            ElevatedButton(
              child: const Text('현재 위치 찾기',
                                style: TextStyle(fontSize: 24)),
              onPressed: (){
                _getCurrentLocation();
              },
            ),
            SizedBox(height: 50,),
            ElevatedButton(
            child: const Text('현재 주소 구하기',
                                style: TextStyle(fontSize: 24)),
            onPressed: (){
                 _getAddressFromLatLng();
              },
            ),
          ],
        ),
      ),
    );
  }
}