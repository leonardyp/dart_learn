/*
 * @Author: Leonard
 * @Date: 2022-05-08 09:06:51
 * @LastEditors: Leonard
 * @LastEditTime: 2022-05-08 15:18:13
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /flutter_demo/dart-learn/hello.dart
 */
void main(List<String> args) {
  print("hello world");
  print("${3 + 2}");
  print("${'world'.toUpperCase()}");
  print(stringify(2, 3));

  // 可空变量
  String? address;
  print('$address');

  // 避空运算符
  int? a = 1;
  a ??= 3;
  print(a);
  assert(a == 1);
  int? b;
  b ??= 3;
  print(b);
  assert(b == 3);
  print(1 ?? 3);
  print(null ?? 3);

  // 条件属性访问
  //要保护可能会为空的属性的正常访问，请在点（.）之前加一个问号（?）。
  //返回 大写的str，或者null
  String? upperCaseIt(String? str) {
    // Try conditionally accessing the `toUpperCase` method here.
    return str?.toUpperCase();
  }

  print(upperCaseIt("str"));

  // list
  final aListOfStrings = ["1", "2", "3"]; // 或 <String>[];
  // set
  final aSetOfStrings = {"1", "2", "3"}; // 或<String>{};
  // map
  final aMapOfStringsToInts = {
    "one": 1,
    "two": 2,
    "three": 3,
  }; // 或 <String,int>{};

  // 级联，对同一对象执行一系列操作
  BigObject fillBigObject(BigObject obj) {
    return obj
      ..anInt = 1
      ..aString = 'String!'
      ..aList.add(1)
      ..allDone();
  }

  // 可选位置参数
  String joinWithCommas(int a, [int? b, int? c, int? d, int? e]) {
    int sum = a;
    if (b != null) {
      sum += b;
    }
    sum += c ?? 0;
    sum += d ?? 0;
    sum += e ?? 0;

    return sum.toString();
  }

  print(joinWithCommas(1, 2, 3));
}

typedef VoidFunction = void Function();

class ExceptionWithMessage {
  final String message;
  const ExceptionWithMessage(this.message);
}

// 命名构造方法，为了允许一个类具有多个构造方法
class Point {
  double x, y;
  Point(this.x, this.y);
  Point.origin()
      : x = 0,
        y = 0;
}

//  使用命名构造方法
final myPoint = Point.origin();

// 工厂构造方法
class Square extends Shape {}

class Circle extends Shape {}

class Shape {
  Shape();
  factory Shape.fromTypeName(String typeName) {
    if (typeName == "square") {
      return Square();
    }
    if (typeName == 'circle') {
      return Circle();
    }
    throw ArgumentError("Unrecognized $typeName");
  }
}

// 重定向构造方法
class Automobile {
  String make;
  String model;
  int mpg;

  // 主要构造方法
  Automobile(this.make, this.model, this.mpg);

  // 代表主要构造方法
  Automobile.hybrid(String make, String model) : this(make, model, 60);

  // 代表命名构造方法
  Automobile.fancyHybrid() : this.hybrid('Futurecar', 'Mark 2');
}

// Const 构造方法
// 类生成的对象永远都不会更改
// 定义 const 构造方法并确保所有实例变量都是 final 的。
class Recipe {
  final List<String> ingredients;
  final int calories;
  final double milligramsOfSodium;
  const Recipe(this.ingredients, this.calories, this.milligramsOfSodium);
}

abstract class Logger {
  void logException(Type t, [String? msg]);
  void doneLogging();
}

// 抛异常处理
void tryFunction(VoidFunction untrustworthy, Logger logger) {
  try {
    untrustworthy();
  } on ExceptionWithMessage catch (e) {
    logger.logException(e.runtimeType, e.message);
  } on Exception {
    logger.logException(Exception);
  } finally {
    logger.doneLogging();
  }
}

/// 可选命名参数，使用大括号语法定义可选命名参数。
/// 一个方法不能同时使用可选位置参数和可选命名参数。
class MyDataObject {
  final int anInt;
  final String aString;
  final double aDouble;

  MyDataObject({
    this.anInt = 1,
    this.aString = 'Old!',
    this.aDouble = 2.0,
  });
  MyDataObject copyWith({int? newInt, String? newString, double? newDouble}) {
    return MyDataObject(
      anInt: newInt ?? this.anInt,
      aString: newString ?? this.aString,
      aDouble: newDouble ?? this.aDouble,
    );
  }
}

class BigObject {
  int anInt = 0;
  String aString = '';
  List<double> aList = [];
  bool _done = false;

  void allDone() {
    _done = true;
  }
}

class InvalidPriceException {}

class ShoppingCart {
  // 私有的 prices 属性。
  List<double> _prices = [];

  // 名为 total 的 getter，用于返回总价格。
  double get total => _prices.fold(0, (e, t) => e + t);

  set prices(List<double> value) {
    if (value.any((element) => element < 0)) {
      throw InvalidPriceException();
    }
    _prices = value;
  }
}

String stringify(int x, int y) {
  return "$x $y";
}
