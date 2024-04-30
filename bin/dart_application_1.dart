import 'dart:mirrors';

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

  // string interpolation
  var name = 'abc';
  var age = 10;
  var greeting = 'my name is $name, I am ${age + 2}';
  print(greeting);

  /**
   * data types
   */
  String str = "str";
  bool boo = true;
  int num = 1;
  double db = 1.1;

  //List
  List<int> numbers2 = [
    1,
    2,
    3,
    4,
    5,
  ];

  var givemefive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    if (givemefive) 5, //collection if
  ];
  numbers2.add(6);
  numbers2.last;

  var old_num = [1, 2, 3];
  var new_num = [
    4,
    5,
    6,
    for (var num in old_num) "!! $num", //collection for
  ];
  print(new_num);

  //Map
  Map<String, Object> player = {
    'name': 'abc',
    'xp': 19.99,
    'skill': false,
  };

  //Set. 중복 불가
  Set<int> set = {1, 2, 3};

  /**
   * functions
   */

  //named prameters
  String sayHello({
    required String name,
    int age = 1,
    String contry = '',
  }) {
    return "$name $age $contry";
  }

  sayHello(age: 12, name: 'abc', contry: 'abc');

  //optional positional parameters
  String sayHello2(String name, int age, [String? contry = '']) {
    return "$name $age $contry";
  }

  sayHello2('abc', 1);

  //qq operator. null이면 ~
  String capitaizeName(String? name) => name?.toUpperCase() ?? 'ABC';
  capitaizeName('abc');
  capitaizeName(null);

  String? name7;
  name7 ??= 'ABC';

  //typedef. 자료형 alias 만들기

  ListOfInts reverse(ListOfInts list) {
    var reversedList = list.reversed;
    return reversedList.toList();
  }

/**
   * classes
   */
  // 인스턴스 생성. new 키워드 붙여도되고 안붙여도됨
  var playerObj = Player();
  playerObj.xp = 2000;
  print(playerObj.name);
  print(playerObj.xp);
  playerObj.sayHello();

  // constructor 이용한 인스턴스 생성
  var player2Obj1 = Player2('one', 1000);
  var player2Obj2 = Player2('two', 1500);

  // named constructor parameters를 이용한 인스턴스 생성
  var palyer3Obj = Player3(
    name: 'abc',
    xp: 1000,
    team: 'dfdf',
    age: 11,
  );

  //named constructor
  var palyer4Obj_blue = Player4.createBluePlayer(
    name: 'blue',
    age: 11,
  );

  var palyer4Obj_red = Player4.createRedPlayer('red', 11);

  var player3Obj_2 = Player3(
    name: 'abc',
    xp: 1000,
    team: 'dfdf',
    age: 11,
  );

  //수정하려면 원래 다음과같이 작성
  player3Obj_2.xp = 2000;
  player3Obj_2.age = 12;

  // Cascade operator
  var player3Obj_3 = Player3(name: 'abc', xp: 1000, team: 'dfdf', age: 11)
    ..xp = 2000
    ..age = 12;

  var player3Obj_4 = player3Obj_3
    ..xp = 3000
    ..age = 13;

  //enum을 사용한 안전한 객체 생성
  var player5Obj = Player5(
    name: 'abc',
    xp: XpLevel.beginner,
    team: Team.blue,
    age: 11,
  );
}

typedef ListOfInts = List<int>;

class Player {
  final String name = 'abc';
  int xp = 1500;

  void sayHello() {
    print('hi i am $name'); //같은 이름의 변수가 있지않는 이상 메서드안에서 this.name의 사용을 권장하지 않음.
    // var name = '2323';
    // print('hi i am ${this.name}');
  }
}

class Player2 {
  // 1번 방법
  // late final String name;
  // late int xp;

  //constructor
  // Player2(String name, int xp) {
  //   this.name = name;
  //   this.xp = xp;
  // }

  // 2번 방법
  final String name;
  int xp;

  Player2(this.name, this.xp);
}

class Player3 {
  final String name;
  int xp;
  String team;
  int age;

  // named constructor parameters
  Player3({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });
}

class Player4 {
  final String name;
  int xp, age;
  String team;

  Player4({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  // named constructor.  콜론 키워드를 사용해서 클래스로 만든 객체 초기화해줌.
  Player4.createBluePlayer({
    required String name,
    required int age,
  })  : this.name = name,
        this.age = age,
        this.team = 'blue',
        this.xp = 0;

  Player4.createRedPlayer(String name, int age)
      : this.name = name,
        this.age = age,
        this.team = 'red',
        this.xp = 0;
}

enum Team { red, blue }

enum XpLevel { beginner, medium, pro }

class Player5 {
  final String name;
  XpLevel xp;
  Team team;
  int age;

  // named constructor parameters
  Player5({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });
}
