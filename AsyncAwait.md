# Async Await Notes

## [Reject in Async/Await Syntax](https://stackoverflow.com/questions/42453683/how-to-reject-in-async-await-syntax)
```
try {
    await foo();
} catch (error) {
    // Here, `error` would be an `Error` (with stack trace, etc.).
    // Whereas if you used `throw 400`, it would just be `400`.
}
```

## [Awaiting within an arrow function](https://github.com/tc39/ecmascript-asyncawait/issues/7#issuecomment-148748622)
So just to clarify, the original example (which doesn't work):
```
async function renderChapters(urls) {
  urls.map(getJSON).forEach(j => addToPage((await j).html));
}
```
Could actually be written in one of three ways:

1) Pages added sequentially as they come in.
```
  async function renderChapters(urls) {
    for (let j of urls.map(getJSON)) {
      addToPage((await j).html);
    }
  }
```

2) Wait until all requests are complete before adding them all at same time:
```
  async function renderChapters(urls) {
    (await Promise.all(urls.map(getJSON))).forEach(j => addToPage(j.html));
  }
```

3) Each object will be added to the page as it arrives (possibly out of order).
```
  async function renderChapters(urls) {
    await Promise.all(urls.map(getJSON).map(async j => addToPage((await j).html)));
  }
```
