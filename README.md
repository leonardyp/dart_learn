<!--
 * @Author: Leonard
 * @Date: 2022-05-08 09:08:28
 * @LastEditors: Leonard
 * @LastEditTime: 2022-05-13 08:44:58
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /dart_learn/README.md
-->
1. => (胖箭头) 简写语法用于仅包含一条语句的函数。该语法在将匿名函数作为参数传递时非常有用：     
    ```flybyObjects.where((name) => name.contains('turn')).forEach(print);```
2. dart 支持单继承，可通过Mxins 在多个类层次结构中重用代码：
```dart
//声明一个 Mixin :
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  // ···
}
//PilotedCraft 类中就包含了 astronauts 字段以及 describeCrew() 方法。
```
3. Dart 没有 interface 关键字。所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现。

4. late 关键字
```
// 延迟赋值，确定变量在使用前被赋值
// 应用场景1:变量可能不使用，但是初始化很昂贵
```
late String temperature = _readThermometer(); // Lazily initialized.
```
// 应用场景2:在处理循环引用很有帮助：
class Team {
  late final Coach coach;
}

class Coach {
  late final Team team;
}

void main() {
  final myTeam = Team();
  final myCoach = Coach();
  myTeam.coach = myCoach;
  myCoach.team = myTeam;

  print('All done!');
}
```
5. `$variableName` 或 ${expression} 表示字符串插值

6. 所有可以赋值给变量的都是对象，所有对象都继承自 Object类

7. 空安全：?可空 !非空  
    int x = nullableButNotNullInt!
8. Dart 支持泛型，比如 List<int>（表示一组由 int 对象组成的列表）或 List<Object>（表示一组由任何类型对象组成的列表）。

9. 私有成员： 标识符以下划线 (_) 开头