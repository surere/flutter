import 'd19_class3_private2.dart';

class Unit
{

  // 변수명 그냥 쓰면 public, _로 시작하면 private(암묵적)
  late String _name;
  late int age;

  // 생성자 간단하게 사용하기
// 어차피 연결할 거 ... 파라미터 부분에서...
  Unit(this._name, this.age);
}

void main() {
  // Unit 클래스는 같은 라이브러리 이므로 private멤버도 접근 가능하다.
  var unit1 = Unit("마린", 25);
  print(unit1._name); // private 이지만 에러 없이 출력됨(Java에서는 에로)
  print(unit1.age);

  var unit2 = Unit2("메딕", 20);
  // print(unit1._name); // private 적용됨 다른 파일 이므로 에러남
  // print(unit2.age); // private 적용됨
}

/*
 dart에서는 하나의 파일이 
 */