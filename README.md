<!--
 * @Author: Leonard
 * @Date: 2022-05-08 09:08:28
 * @LastEditors: Leonard
 * @LastEditTime: 2022-05-08 09:54:31
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
