/*
 * @Author: Leonard
 * @Date: 2022-05-08 14:37:38
 * @LastEditors: Leonard
 * @LastEditTime: 2022-05-11 13:08:51
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /dart_learn/iterable.dart
 */
void main(List<String> args) {
  // Iterable<int> iterable = [1, 2, 3];
  // print(iterable.elementAt(0)); // 跟List 不同，不可以通过下标访问

  // const iterable = [2, 3, 4];
  // for (var item in iterable) {
  //   print(item);
  // }
  Iterable<int> iterable = const [1, 2, 3, 31, 2];
  print('${iterable.first} ${iterable.last}');
  print(iterable.firstWhere((element) => element > 5));
  print(iterable.firstWhere((element) {
    return element > 5;
  }));

  print(singleWhere(["a", "smac", "macc", "damc"]));
  const items = ['Salad', 'Popcorn', 'Toast'];
  if (items.any((element) => element.contains('a'))) {
    print('At least one item contains "a"');
  }
  if (items.every((element) => element.length >= 5)) {
    print('All items have length >= 5');
  }
  whereDemo();
  takeOrSkipWhileDemo();
}

// Filtering 过滤器
whereDemo() {
  Iterable evens = const [1, -2, 3, 42].where((element) => element.isEven);
  for (var item in evens) {
    print('even: $item');
  }
}

// Filtering 过滤器
takeOrSkipWhileDemo() {
  const numbers = [1, 3, -2, 0, 4, 5];
  Iterable<int> numbersUntilZero = numbers.takeWhile((value) => value != 0);
  print('numbersUntilZero: $numbersUntilZero'); // numbersUntilZero: (1, 3, -2)

  var numbersStartingAtZero = numbers.skipWhile((value) => value != 0);
  print(
      'numbersStartingAtZero: $numbersStartingAtZero'); // numbersStartingAtZero: (0, 4, 5)
}

class User {
  String name;
  int age;

  User(this.name, this.age);
}

// mapping
Iterable<String> getNameAndAges(Iterable<User> users) {
  return users.map((e) => '${e.name} is ${e.age}');
}

Iterable<User> filterOutUnder21(Iterable<User> users) {
  return users.where((element) => element.name.length <= 3);
}

bool anyUserUnder18(Iterable<User> users) {
  return users.any((element) => element.age < 18);
}

bool everyUserOver13(Iterable<User> users) {
  return users.every((element) => element.age > 13);
}

String singleWhere(Iterable<String> items) {
  return items.singleWhere(singleWhereFunc);
}

bool singleWhereFunc(String str) {
  if (str.startsWith('m')) {
    if (str.contains('a')) {
      return true;
    }
  }
  return false;
}
