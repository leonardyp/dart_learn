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
  >