# Typescript Notes


##  Function object with properties
When converting JS to TS, you often run into code where you have
```
var f = function() { }
f.someValue = 3;
```
To get this typed properly, you can declare it as:
```
function f() { }
namespace f {
    export var someValue = 3;
}
```

Or
```
declare function f(): void;
declare namespace f {
    export var someValue: number;
}
```

Or as ES6 Module:
```
function hello() { .. }
namespace hello { export const value = 5; }
export default hello; 
```
Ref: [StackOverflow](https://stackoverflow.com/a/33392782/2868437),
[TS Declaration Merging](https://www.typescriptlang.org/docs/handbook/declaration-merging.html)
