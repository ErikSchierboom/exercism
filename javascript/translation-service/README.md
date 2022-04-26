# Translation Service

Welcome to Translation Service on Exercism's JavaScript Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The [`Promise`][promise-docs] object represents the eventual completion (or failure) of an
asynchronous operation and its resulting value.

The methods [`promise.then()`][promise-then], [`promise.catch()`][promise-catch], and [`promise.finally()`][promise-finally] are used to associate further action with a promise that becomes settled.

For example:

```javascript
const myPromise = new Promise(function (resolve, reject) {
  let sampleData = [2, 4, 6, 8];
  let randomNumber = Math.ceil(Math.random() * 5);
  if (sampleData[randomNumber]) {
    resolve(sampleData[randomNumber]);
  } else {
    reject('An error occured!');
  }
});

myPromise
  .then(function (e) {
    console.log(e);
  })
  .catch(function (error) {
    throw new Error(error);
  })
  .finally(function () {
    console.log('Promise completed');
  });
```

## Methods

These methods are available on `Promise.prototype`

**then**

> The `.then()` method takes up to two arguments; the first argument is a callback function for the resolved case of the promise, and the second argument is a callback function for the rejected case. Each `.then()` returns a newly generated promise object, which can optionally be used for chaining.[^1]

```javascript
const promise1 = new Promise(function (resolve, reject) {
  resolve('Success!');
});

promise1.then(function (value) {
  console.log(value);
  // expected output: "Success!"
});
```

**catch**

> A `.catch()` is just a `.then()` without a slot for a callback function for the case when the promise is resolved. It is used to handle rejected promises.[^2]

```javascript
const promise1 = new Promise((resolve, reject) => {
  throw 'An error occured';
});

promise1.catch(function (error) {
  console.error(error);
});
// expected output: An error occured
```

**finally**

> When the promise is settled, i.e either fulfilled or rejected, the specified callback function is executed. This provides a way for code to be run whether the promise was fulfilled successfully or rejected once the Promise has been dealt with.[^3]

```javascript
function findDataById(id) {
  return new Promise(function (resolve, reject) {
    let sampleData = [1, 2, 3, 4, 5];
    if (sampleData[id]) {
      resolve(sampleData[id]);
    } else {
      reject(new Error('Invalid id'));
    }
  });
}

findDataById(4)
  .then(function (response) {
    console.log(response);
  })
  .catch(function (err) {
    console.error(err);
  })
  .finally(function () {
    console.log('Promise completed');
  });
```

---

[^1]: `then`, MDN. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
[^2]: `catch`, MDN. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch
[^3]: `finally`, MDN. https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally

[promise-docs]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
[promise-catch]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch
[promise-then]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then
[promise-finally]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/finally

## Instructions

In this exercise, you'll be providing a `TranslationService` that provides basic translation services to free members, and advanced translation to premium members with quality assurances.

**The API**

You have found an outer space translation API that fulfills any translation `request` in a reasonable amount of time.
You want to capitalize on this.
The space translators are extremely fickle and hate redundancy, so they also provide _API storage_ satellites where you can `fetch` past translations without bothering them.

**_Fetching a translation_**

`api.fetch(text)` fetches a translation of `text` from the _API storage_ and returns a `promise` that provides two values:

- `translation`: the actual translation
- `quality`: the quality expressed as a number

If a translation is not found in the _API storage_, the API throws a `NotAvailable` error.
Translations can be added using the `api.request` method.
If 'text' is not translatable, the API throws an `Untranslatable` error.

```javascript
api.fetch('jIyaj');
// => Promise({ resolved: 'I understand' })
```

**_Requesting a translation_**

Some translations are sure to exist, but haven't been added to the _API storage_ yet. That's the difference between `NotAvailable` ( not in storage, but can be requested ) and `Untranslatable` ( cannot be translated ).

`api.request(text, callback)` requests that a translation of `text` be performed and added into the _API storage_.
On completion the `callback` function is called.

- On success `callback` is passed `undefined`: this indicates the translation was successful and is accessible using the `api.fetch` method.
- On failure `callback` is passed an `error`: this indicates something went wrong.
  The outspace API is _unstable_, which means that the API fails often.
  If that happens, it is okay to `api.request` again.

```javascript
api.request('majQa’');
// => Promise({ resolved: undefined })
```

**⚠ Warning! ⚠**

```exercism/caution
The API works its magic by teleporting in the various translators when a `request` comes in.
This is a very costly action, so it shouldn't be called when a translation *is* available.
Unfortunately, not everyone reads the manual, so there is a system in place to kick-out bad actors.

If an `api.request` is called for `text` is available, the API throws an `AbusiveClientError` for this call, **and every call after that**.
Ensure that you *never* request a translation if something has already been translated.
```

## 1. Fetch a translation, ignoring the quality

The free service only provides translations that are currently in the _API storage_.

Implement a method `free(text)` that provides free members with translation that already exist in the _API storage_.
Ignore the quality and forward any errors thrown by the API.
``

- Returns the translation if it can be retrieved, regardless of its quality
- Forwards any error from the translation API
- Uses the `api.fetch` method (`api.fetch` returns a `promise`)

```javascript
service.free('jIyaj');
// => Promise<...> resolves "I understand."

service.free("jIyajbe'");
// => Promise<...> rejects Error("Not yet translated")
```

## 2. Fetch a batch of translations, all-or-nothing

Implement a method `batch([text, text, ...])` for free members that translates an array of text using the free service, returning all the translations, or a single error.

- Resolves with all the translations (in the same order), if they are all available
- Rejects with the first error that is encountered
- Rejects with a `BatchIsEmpty` error if no texts are given

```javascript
service.batch(['jIyaj', "majQa'"]);
// => Promise<...> resolves ["I understand.", "Well done!"]

service.batch(['jIyaj', "jIyajbe'"]);
// => Promise<...> rejects new Error("Not yet translated")

service.batch([]);
// => Promise<...> rejects BatchIsEmpty()
```

## 3. Request a translation, retrying at most 2 times

Implement a premium user method `request(text)`, that _requests_ a translation be added to the _API storage_.
The request should automatically retry if a failure occurs.  
It should perform no more than **3 calls** for the same request (_don't upset the space translators!!!_).

- If `api.request` does not return an error, resolve with `undefined`
- If `api.request` returns an error, retry at most two times
- If you run out of retries, reject with the last error received

```javascript
service.request("jIyajbe'");
// => Promise<...> resolves (with nothing), can now be retrieved using the fetch API
```

## 4. Fetch a translation, inspect the quality, or request it

Implement a premium user method `premium(text, quality)` to fetch a translation.
If a translation is `NotAvailable`, request the translation and fetch it after its been added to the _API storage_.
The method should only return the translation if it meets a certain `quality` threshold.

- If `api.fetch` resolves, check the quality before resolving
- If `api.fetch` rejects, _request_ the translation instead
- If `api.request` rejects, forward the error

```javascript
service.premium("jIyajbe'", 100);
// => Promise<...> resolves "I don't understand."

service.premium("'arlogh Qoylu'pu'?", 100);
// => Promise<...> rejects QualityThresholdNotMet()

service.premium("'arlogh Qoylu'pu'?", 40);
// => Promise<...> resolves "What time is it?"
```

**N.B.**

```exercism/note
The correct translation of `'arlogh Qoylu'pu'?` is **How many times has it been heard?**.
```

## Source

### Created by

- @SleeplessByte

### Contributed to by

- @AndrewLawendy