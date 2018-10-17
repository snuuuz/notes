# WebStorm Notes


## JavaSript General Signature mismatch Inspector

* Try "File > Invalidate caches, Invalidate and restart"
for errors like
`Argument type [Promise<MyClass>, Promise<MyOtherClass>] is not assignable to parameter type [(PromiseLike<MyClass> | MyClass), (PromiseLike<MyOtherClass> | MyOtherClass), (PromiseLike<any> | any), (PromiseLike<any> | any), ...this repeats several times...]`
[Ref](https://intellij-support.jetbrains.com/hc/en-us/community/posts/360000721339-JavaSript-General-Signature-mismatch-Inspector-showing-weird-error)
