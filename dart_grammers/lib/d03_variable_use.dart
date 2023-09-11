void main()
{
  int num1 = 1;
  double num2 = 2.1;
  String name = "홍길동";

  myFunction1(num1);    //가능
  // myFunction(num2);  // 에러 정수밖에 받지 못하는데 실수이기 때문에 받지 못하는 것

  myFunction2(num1);    // 가능 : num은 int, double의 supertype
  myFunction2(num2);    // 가능 매개변수를 이런식으로 선언하면 다 가져다 사용할 수 있음

  myFunction3(num1);    // 가능 : dynamic은 자바에서의 Object 같은 ...
  myFunction3(num2);    // 가능
  myFunction3(name);    // 가능
}

  myFunction1(int val)
{
  print("func1 : $val");
}

myFunction2(num val)
{
  print("func2 : $val");
}

myFunction3(dynamic val)
{
print("func3 : $val");
}