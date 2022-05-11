///  Future<T> 产生类型T的值
///  Future<void> 表示没有产生任何值
/// future 两个状态：completed，uncompleted
/// Future: dart的类
/// future: Future 类的实例
///
/// async 方法返回值需要Futrue，await 必须出现在sync方法体内
Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() {
  return Future.delayed(
    const Duration(seconds: 2),
    () => 'Large Latte',
  );
}

void main(List<String> args) async {
  print('Fetching user order...');
  print(await createOrderMessage());
}
