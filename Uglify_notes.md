# Optimize numerical expressions
Set unsafe_math flag to optimize numerical expressions but may give imprecise floating point results.
```
uglifyOptions: {
  compress: {
    unsafe_math: true, 
  }
}
```

## Example 1
```
const len = (text && text.length) || 0;
const width = fontSize * (len * 0.4);
```
Becomes this **without** optimization
```
return t * (.4 * (e && e.length || 0));
```
or this **with** optimization
```
return .4 * t * (e && e.length || 0);
```

## Example 2
```
if      (timeUnit === "h") durationMS = value * 3600000;
else if (timeUnit === "d") durationMS = value * 3600000 * 24;
else if (timeUnit === "w") durationMS = value * 3600000 * 24 * 7;
else if (timeUnit === "m") durationMS = value * 3600000 * 24 * 30;
else if (timeUnit === "y") durationMS = value * 3600000 * 24 * 365.25;
```
Becomes this **without** optimization
```
"h" === d ? p = 36e5 * e : "d" === d ? p = 36e5 * e * 24 : "w" === d ? p = 36e5 * e * 24 * 7 : "m" === d ? p = 36e5 * e * 24 * 30 : "y" === d && (p = 36e5 * e * 24 * 365.25);
```
or this **with** optimization
```
"h" === d ? p = 36e5 * e : "d" === d ? p = 864e5 * e : "w" === d ? p = 6048e5 * e : "m" === d ? p = 2592e6 * e : "y" === d && (p = 315576e5 * e);
```
