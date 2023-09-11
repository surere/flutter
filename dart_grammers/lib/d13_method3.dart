import 'package:dart_grammers/d11_method1.dart';

void main()
{
  // 메서드도 변수에 대입이 가능
  // Dart에서는 메서드를 객체로 취급하기 때문
  var myFunc = addTwoNum;

  // 변수를 이용하여 메서드 호출 : 메서드명의 리네임 같다.
  myFunc(1,2);

  // 메서드 파라미터에 메서드를 사용
  something("2", "3", myFunc);
}

void addTwoNum(int a, int b){
  print(a+b);
}

void something(var a, var b, var c){
  int val1 = int.parse(a); // 정수형
  int val2 = int.parse(b); // 정수형을 부른 것

  // c는 메서드이므로...
  c(val1, val2);
}
