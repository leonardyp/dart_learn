```
输入上标，如x2,Markdown代码为x^2^;
输入下标，如x0,Markdown代码为x~0~;
```

 abstract ^2^  | else | import^2^ | show^1^
------------- | ------------- | ------------- | -------------
as^2^  | enum | in | static ^2^
assert  | export^2^ | interface^2^ | super
async^1^ | extends | is | switch 
await^3^ | extension^2^ | late^2^ | sync^1^
break | external^2^ | library^2^ | this
case | factory^2^ | mixin^2^ | throw
catch | false | new | true
class | final | null | try
const | finally | on^1^ | typedef^2^
continue | for | operator^2^ | var
covariant^2^ | Function^2^ | part^2^ | void
default | get^2^ | required^2^ | while
deferred^2^ | hide^1^ | rethrow | with
do | if | return | yield^3^
dynamic^2^ | implements^2^ | set^2^

> 带有上标的单词可以在必要的情况下作为标识符：
    > 1. 带有上标 1 的关键字为 上下文关键字，只有在特定的场景才有意义，它们可以在任何地方作为有效的标识符。  
    > 
    > 2. 带有上标 2 的关键字为 内置标识符，这些关键字在大多数时候都可以作为有效的标识符，但是它们不能用作类名或者类型名或者作为导入前缀使用。
    > 
    > 3. 带有上标 3 的关键字为 Dart 1.0 发布后用于 支持异步 相关内容。不能在由关键字 async、async* 或 sync* 标识的方法体中使用 await 或 yield 作为标识符。
    > 
    > 4. 其它没有上标的关键字为 保留字，均不能用作标识符。

> ### 共63个关键字，5个上下文关键字，23个内置标识符，2个异步关键字， 33个保留字