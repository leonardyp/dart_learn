<!--
 * @Author: Leonard
 * @Date: 2022-05-14 09:59:02
 * @LastEditors: Leonard
 * @LastEditTime: 2022-05-15 10:21:53
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /dart_learn/common.md
-->
## 语言概览
- Final && const
    > final 只能被赋值一次，const是编译时常量，如果使用 const 修饰类中的变量，则必须加上 static 关键字，即 static const
    > const 关键字不仅仅可以用来定义常量，还可以用来创建 常量值，该常量值可以赋予给任何变量。你也可以将构造函数声明为 const 的，这种类型的构造函数创建的对象是不可改变的。
    ```
    var foo = const [];
    final bar = const [];
    const baz = []; // Equivalent to `const []`
    ```
    > 没有使用 final 或 const 修饰的变量的值是可以被更改的，即使这些变量之前引用过 const 的值。
    ```
        foo = [1, 2, 3];

        var constantList = const [1, 2, 3];
        // constantList[1] = 1; // This line will cause an error.
    ```
- Dart 字符串（String 对象）包含了 UTF-16 编码的字符序列
- 使用三个单引号或者三个双引号也能创建多行字符串:
    > var s1 = '''
You can create
multi-line strings like this one.
''';
- raw string：
  > var s = r'In a raw string, not even \n gets special treatment.';

- 扩展操作符（...）和 空感知扩展操作符（...?）:
  > var list = [1, 2, 3];
var list2 = [0, ...list];  
如果list可能为空则采用：
var list2 = [0, ...?list];

- `集合中的 if` 和 `集合中的 for`
  > var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  > var listOfInts = [1, 2, 3];
var listOfStrings = ['0', for (var i in listOfInts) 'demo:$i'];

- set：
  > 因为先有的 Map 字面量语法，所以 {} 默认是 Map 类型。如果忘记在 {} 上注释类型或赋值到一个未声明类型的变量上，那么 Dart 会创建一个类型为 Map<dynamic, dynamic> 的对象。
  
- Map:
  > 键和值都可以是任何类型的对象

- 参数
  > 1. 必要
    > 可以使用 required 来标识一个命名参数是必须的参数：
    ```dart 
    const Scrollbar({Key? key, required Widget child})
    ```
  > 2. 可选
      1. 命名，命名参数默认为可选参数，除非他们被特别标记为 required。使用 {参数1, 参数2, …} 来指定命名参数：
      ```dart
      void enableFlags({bool? bold, bool? hidden}) {...}
      ```
      2. 位置，可选的位置参数
      ```dart
        String say(String from, String msg, [String? device])
      ```
- 默认参数值
  ```dart
    void enableFlags({bool bold = false, bool hidden = false})
    String say(String from, String msg, [String device = 'carrier pigeon'])
  ```
- 条件表达式
  > 条件 ? 表达式 1 : 表达式 2
  ```dart
  var visibility = isPublic ? 'public' : 'private';
  ```
  > 表达式 1 ?? 表达式 2  
  >> 如果表达式 1 为非 null 则返回其值，否则执行表达式 2 并返回其值。
  ```dart
  String playerName(String? name) => name ?? 'Guest';
  ```
- 级联运算符，(..，?..) 可以让你在同一个对象上连续调用多个对象的变量或方法。返回值为 void 的方法则不能使用级联运算符。
  ```dart
    var paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

    替换：
    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 5.0;
  ```
- switch case
  每一个非空的 case 子句都必须有一个 break 语句，也可以通过 continue、throw 或者 return 来结束非空 case 语句。
  Dart 支持空的 case 语句，允许其以 fall-through 的形式执行。
  ```dart
  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED': // Empty case falls through.
    case 'NOW_CLOSED':
    // Runs for both CLOSED and NOW_CLOSED.
      executeNowClosed();
      break;
  }
  //在非空 case 语句中想要实现 fall-through 的形式，可以使用 continue 语句配合 label 的方式实现:
  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED':
      executeClosed();
      continue nowClosed;
      // Continues executing at the nowClosed label.

    nowClosed:
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      executeNowClosed();
      break;
  }
  ```
- 断言
  assert(条件, 可选信息); 如果表达式的值为 false，则断言失败，抛出一个 AssertionError 异常。
  如何判断 assert 是否生效？assert 是否生效依赖开发工具和使用的框架：

    Flutter 在调试模式时生效。

    一些开发工具比如 `dartdevc` 通常情况下是默认生效的。

    其他一些工具，比如 `dart run` 以及 `dart2js` 通过在运行 Dart 程序时添加命令行参数 `--enable-asserts` 使 assert 生效。

  `在生产环境代码中，断言会被忽略，与此同时传入 assert 的参数不被判断。`

- 异常
  Dart 中可以将任何非 null 对象作为异常抛出而不局限于 Exception 或 Error 类型。
  > 捕获异常
  ```dart
  try {
     breedMoreLlamas();
  } on OutOfLlamasException {
     buyMoreLlamas();
  }
  // 可以使用 on 或 catch 来捕获异常，使用 on 来指定异常类型，使用 catch 来捕获异常对象，两者可同时使用。
  try {
   breedMoreLlamas();
  } on OutOfLlamasException {
    // A specific exception
    buyMoreLlamas();
  } on Exception catch (e) {
    // Anything else that is an exception
    print('Unknown exception: $e');
  } catch (e) {
    // No specified type, handles all
    print('Something really unknown: $e');
  }
  // 可以为 catch 方法指定两个参数，第一个参数为抛出的异常对象，第二个参数为栈信息 StackTrace 对象：
  try {
   // ···
  } on Exception catch (e) {
    print('Exception details:\n $e');
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
  }
  // rethrow 可以将捕获的异常再次抛出
  void misbehave() {
    try {
      dynamic foo = true;
      print(foo++); // Runtime error
    } catch (e) {
      print('misbehave() partially handled ${e.runtimeType}.');
      rethrow; // Allow callers to see the exception.
    }
  }

  void main() {
    try {
      misbehave();
    } catch (e) {
      print('main() finished handling ${e.runtimeType}.');
    }
  }
  // 无论是否抛出异常，finally 语句始终执行，如果没有指定 catch 语句来捕获异常，则异常会在执行完 finally 语句后抛出：
  try {
    breedMoreLlamas();
  } finally {
    // Always clean up, even if an exception is thrown.
    cleanLlamaStalls();
  }

  try {
   breedMoreLlamas();
  } catch (e) {
    print('Error: $e'); // Handle the exception first.
  } finally {
    cleanLlamaStalls(); // Then clean up.
  }
  ```