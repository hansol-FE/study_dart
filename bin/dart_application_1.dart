import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;

void main(List<String> arguments) {
  print('Hello world: ${dart_application_1.calculate()}!');

  /**
   * 변수 
   * 
   * 1. var 키워드 (권장)
   * 2. 타입 명시: class의 property 작성 시 권장함
   * 3. dynamic 타입 명시: 어떤 타입의 데이터가 들어올지 모를 때
   * 4. final: 한번 값이 정해지면 수정 불가
   * 5. late: 변수 초기값 없이도 선언할 수 있게 해줌. final, var, String 앞에 써줌
   * 6. const: compile-time에 상수 값이 있어야할 때 사용
   */
  var name1 = 'abc';

  String name2 = 'abc';
  int name2_1 = 123;

  dynamic name3 = 'abc';
  if (name3 is String) {}

  final name4 = 'abv';
  final String name4_1 = 'abv';

  late final name5;
  late var name5_1;
  late String name5_2;

  const API_KEY = 'abc';

  /**
   * null safety
   * 
   * 기본적으로 모든 변수는 non-nullable이지만,
   * null 허용 시, 물음표 기호 붙임.
   */
  String? name6 = 'abc';
  name6 = null;
  if (name6 != null) {
    name4.length;
  }
  name6?.length; //단축 문법. null인지 아닌지 확인 후 진행
}
