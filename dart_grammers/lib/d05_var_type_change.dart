void main()
{
  // ###정수, 실수 간 변환 ###
  int num1 = 10;
  double num2 = num1.toDouble();
  num1 = num2.toInt();

  // ### 문자를 숫자로 변환 ###

  // 실패시 Exception
  int inVal = int.parse('10');
  double doubleVal = double.parse('10.1');

  // 실패시 Exception : 예외가 발생하면 그 즉시 프로그램의 실행이 중지된다.
  try{  // 예외가 발생할 수 있으므로 try ~ on을 사용함. 자바에서는 try ~ catch
    var num3 = int.parse('n42');  // 예외 발생 지점
    print(num3);
  } on FormatException catch(e){ // 발생된 예외는 catch절에서 처리한다.
    print('Format error(n42는 숫자 포맷이 아닙니다.)!');
    print(e); // FormatException 에러 메세지
  }

  // 실패시 null. tryParse에 try ~ on이 들어가 있음. 그래서 예외가 생기면 null
  int? inVal2 = int.tryParse('10'); // 10으로 변환
  // tryParse가 null을 받기 위한 것인데 int는 null을 받을 수 없는 것이라 ? 넣어줌
  // int?에서 ?은 뒤에가 tryParse가 false이면 null이 들어간다는 소리.
  double? doubleVal2 = double.tryParse('10.1'); // 10.1로 변환

  // 삼항연산자 형태로 앞부분에서 예외가 발생하면 ?? 뒷부분의 값이 할당된다.
  int val1 = int.tryParse('n42') ?? -1;
  // false면 null값이지만 true면 -1값을 가져오는 것
  // 여기서 int ?가 없는 이유 val1값에 -1이 들어오므로 null이 들어올 수 없음.
  print('val1 = $val1'); // 예외가 발생하므로 -1이 할당됨.

  // var는 어떤값이라도 들어올 수 있다. 즉 null도 들어올 수 있다는 것이므로
  // ? 을 안써도 됨.
  var val2 = int.tryParse('n42');
  print('val2 = $val2');    // 예외가 발생하므로 null이 할당됨.

  // ### 진법 변환 ### 잘사용 안 함, 시험 때문에
  var n_16 = int.parse('FF', radix: 16); // 255 16진법
  print('n_16 : FF -> $n_16');
  var n_8 = int.parse('10', radix: 8); // 8 8진법
  print('n_8 : 10 -> $n_8');
  var n_2 = int.parse('1001', radix: 2); // 9 2진법
  print('n_2 : 1001 -> $n_2');

  int baseNum = 10;
  var val3 = baseNum.toRadixString(16);
  print('10 hex --> 0x$val3');
  var val4 = baseNum.toRadixString(2);
  print('10 hex --> 0b$val4');

}