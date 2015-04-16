layout: true
class: center, middle
---
# Kotlin on Android
[ a Russian island ]

GDG Korea Android Conference 2015  
2015.04.18

.footnote.pull-right[🍴 on [github](https://github.com/importre/kotlin_on_android)]

---
layout: false
.left-column[
# 허재위
<img src='img/importre_github.jpeg' width=150 />
]

.right-column[
## [@importre](https://github.com/importre)
- Github

## Riiid! ([뤼이드!](http://riiid.co)) Co-founder 🚀
- Android

## Web Applications Korea
- http://wakr.org

- https://facebook.com/wakrorg
]

---
class: center, middle
![](img/Kotlin-logo.png)
# Kotlin

.footnote.pull-right[\* [kotlinlang.org](http://kotlinlang.org/)]

---
.left-column[
# Kotlin
<img src='img/Kotlin-logo.png' width=150 />
]

.right-column[

## JetBrains
- IntelliJ > Android Studio > 전폭적인 지원?!

- 1.0은 올 여름에! 👏👏👏
  - https://youtu.be/dJscNr1silY?t=786


## Productivity / Industry

그들의 생산성을 끌어올리기 위해 만듦
- JetBrains IDEs

    - JVM Languages

    - Build System

Java와 같이 이용할 수 있는 데 초점을 맞춤 (Interop ✨)
]

---
## Design Goals 👍
- Java와 호환 가능한 언어

- 적어도 Java만큼 빠른 컴파일

- Java보다 안전하고 간결하게

- Scala 같은 언어보다 간단하게 만들고 싶다!

---
## 그리고,

### 라이선스
- under the `Apache 2` OSS License

  - IntelliJ 플러그인도 마찬가지

### Java 호환성
- 컴파일러는 Java byte-code를 만듦

  - Kotlin can call Java, and v.v.

### 이클립스
- 플러그인([Alpha is out][eclipse])

---
class: center, middle, inverse1
# Why Kotlin?

---
.left-column[
## Why Kotlin?
]

.right-column[
### Concise and Expressive
```kotlin
val people = hashMapOf<String, Int>()
for ((person, age) in people) {
    println("${person} is ${age} years old")
}
```

### Safe
- `null`

### Versatile
- 100% compatible with all JVM frameworks. 💯

- No performance impact.

- Very small runtime.

### Another awesome things
]

---
.left-column[
## Data Classes
]

.right-column[
```kotlin
data class User(val name: String, val age: Int)
```

컴파일러가 모든 프로퍼티로부터 아래 멤버들을 만들어 냄
- `equals()` / `hashCode()` pair

- `toString()` of the form "`User(name=John, age=42)`"

- `copy()`

.footnote[\* [Data classes](http://kotlinlang.org/docs/reference/data-classes.html)]
]

---
.left-column[
## Data Classes
## Lambdas
]

.right-column[
### Lock Example
```kotlin
fun lock<T>(lock: Lock, body: () -> T): T {
  lock.lock()
  try {
    return body()
  } finally {
    lock.unlock()
  }
}
```

```kotlin
lock (l, {
  // doSomething()
})
```

### Kotlin Convention
```kotlin
lock (l) {
  // doSomething()
}
```
]

---
.left-column[
## Data Classes
## Lambdas
]

.right-column[
### Omiited parameter, `it`

```kotlin
val result = array("hello", ",", "world", "!") filter {
  it.length == 5
} sortBy {
  it
} map {
  it.toUpperCase()
}

println(result) // [HELLO, WORLD]
```

.footnote[\* [Lambdas](http://kotlinlang.org/docs/reference/lambdas.html)]

]
---
.left-column[
## Data Classes
## Lambdas
## Null Safety
]

.right-column[
### Nullable types and Non-Null Types
```kotlin
var a: String = "abc"
a = null // compilation error

var b: String? = "abc"
b = null // ok
```

### Checking for `null` in conditions
```kotlin
val l = if (b != null) b.length() else -1
```

### Safe Calls
```kotlin
b?.length()                 // b가 null이면 null을 반환

bob?.department?.head?.name // 하나라도 null이면 null을 반환
```

.footnote[\* [Null Safety](http://kotlinlang.org/docs/reference/null-safety.html)]
]

---
.left-column[
## Data Classes
## Lambdas
## Null Safety
]

.right-column[
### Elvis Operator `?:`

```kotlin
val l = b?.length() ?: -1
```

### The `!!` Operator
```kotlin
val l = b!!.length()
```

`b`가 `null`이면 NPE 발생

### Safe Casts
```kotlin
val aInt: Int? = a as? Int
```

.footnote[\* [Null Safety](http://kotlinlang.org/docs/reference/null-safety.html)]
]

---
.left-column[
## Data Classes
## Lambdas
## Null Safety
## Extension Methods
]

.right-column[
### Add `toast` method to `Activity`
```kotlin
fun Activity.toast(message: CharSequence,
                   duration: Int = Toast.LENGTH_SHORT) {
  Toast.makeText(this, message, duration).show()
}
```

### in your `Activity`, Run!!!
```kotlin
view.setOnClickListener {
  toast("Hello world!")
}
```

.footnote[\* [Extensions](http://kotlinlang.org/docs/reference/extensions.html)]
]

---
.left-column[
## Data Classes
## Lambdas
## Null Safety
## Extension Methods
## Java Interop
]

.right-column[
### Notation for Platform types
- `T!` means "`T` or `T?`",

- `Array<(out) T>!` means
    - Java array of `T` (or a subtype of `T`),

    - nullable or not

### wait()/notify()
```kotlin
(foo as java.lang.Object).wait()
```

### getClass()
```kotlin
val fooClass = foo.javaClass
```

.footnote[\* [Java Interop](http://kotlinlang.org/docs/reference/java-interop.html)]
]

---
.left-column[
## Data Classes
## Lambdas
## Null Safety
## Extension Methods
## Java Interop
## etc,
]

.right-column[
### Smart Casts
```kotlin
val activity = getActivity()

if (activity is MyActivity) {
  activity.yourMethod()
}
```

### Singletons
```kotlin
public class Renote {

  companion object {
    public val TAG: String = "Renote"
  }

}
```
]

---
class: center, middle

![](img/popular.png)
# Popular
A Sample application written in Kotlin and using Anko

---
class: center, middle

# Get it on Google play
![](img/popular_qr.png)

https://play.google.com/store/apps/details?id=io.github.importre.popular
---
.left-column[
## Popular
<img src='img/popular.png' width=150 />
]

.right-column[
## Goal

- Show popular images and video of Instagram

<img src='img/n5_land.png' width=800 />

https://github.com/importre/popular
]

---
# [Anko (앙꼬)](https://github.com/JetBrains/anko)

안드로이드 앱 개발을 쉽고 빠르게 해주는 라이브러리

```kotlin
verticalLayout {
  val name = editText()

  button("Say Hello") {
    onClick {
      toast("Hello, ${name.text}!")
    }
  }
}
```
## 예제
[Main Layout of Popular][anko_popular]

.footnote.pull-right[\* [who anko?](http://blog.jetbrains.com/kotlin/2015/04/announcing-anko-for-android/)]

.footnote.pull-right[]

---
class: center, middle, inverse2
![](http://developer.android.com/images/home/l-hero.png)
# Android

---
.left-column[
## Pre-conditions
]

.right-column[
### Android Studio

### Plugins
- Kotlin

- Kotlin Extensions For Android (optional)
    - kotlin 버전과 동일한 버전
]

---
.left-column[
## Pre-conditions
## Gradle
]

.right-column[
### Configuring Dependencies
현재 버전: `0.11.91.1`

```groovy
buildscript {
  ...
  dependencies {
*   classpath "org.jetbrains.kotlin:" +
*             "kotlin-gradle-plugin:$kotlin_version"
  }
  ...
}
```

```groovy
*apply plugin: 'kotlin-android'
...
dependencies {
  ...
* compile "org.jetbrains.kotlin:" +
*         "kotlin-stdlib:$kotlin_version"
  ...
}
```
]
---
.left-column[
## Pre-conditions
## Gradle
]

.right-column[
### Setting source sets (Optional)
```groovy
android {
  ...

  sourceSets {
*   main.java.srcDirs += 'src/main/kotlin'
  }
}
```

원래 필수로 `kotlin` 디렉토리를 지정해야 했으나,

이제는 `java` 디렉토리에 `.kt` 파일을 넣어도 됩니다. 😍
]

---
.left-column[
## Pre-conditions
## Gradle
## Examples
]

.right-column[
### Retrofit
```kotlin
public trait RenoteServiceV1 {
*   PATCH("/api/v1/user.json")
*   fun patchUser(Body user: User): Observable<UserResult>
}
```
- M12부터 `trait` > `interface`

### Rxjava
```kotlin
private fun changeNickname(token: String, title: String) {
    val user = User(token = token, nickname = title)
*   Renote.service.patchUser(user)
*       .observeOn(AndroidSchedulers.mainThread())
*       .subscribe({ result ->
*           doSomething(result)
*       }, { throwable ->
*           handleError(throwable)
*       }, {
*           complete()
*       })
}
```
]

---
.left-column[
## Pre-conditions
## Gradle
## Examples
## Renote!
]

.right-column[
## Project `Renote!` Languages

#### Java 87.7%
#### HTML 5.8%
### Kotlin `6.5%`

.right[![](img/launchericon.png)]

.footnote[\* [Renote!](https://play.google.com/store/apps/details?id=co.riiid.renote)]
]

---
.left-column[
## Pre-conditions
## Gradle
## Examples
## Renote!
]

.right-column[
## Kotlin? 쓸까? 말까? 😱

### 계속 바뀌네요. 문법이...

### IDE 플러그인 오류
- 지금은 쓸만해? 졌어요! 😂

### 안드로이드 공식 언어는 `Java`
- [Google I/O 2014 - Android fireside chat](https://youtu.be/K3meJyiYWFw?t=1560)

  - 26분 부터

#겁나 겁나군요 🙈
]

---
.left-column[
## Pre-conditions
## Gradle
## Examples
## Renote!
]

.right-column[
## 그냥 하죠 뭐 🆒

1. API 부분만 `Kotlin`으로 바꿈
  - Java에서 호출 잘 돼요 :^)

1. 메인, 설정화면의 `Activity`, `Fragment`를 Kotlin으로 바꿈

  - Android Studio(IntelliJ) 👍

  - 메뉴: `Code` | `Convert Java file to Kotlin file`

  - 완벽히 바뀌지 않는 경우도 있으니, 수작업으로...
]

---
class: center, middle
# 하나 더 🐣

---
# Android Extension
## Something Cool~

```kotlin
// Using R.layout.main
import kotlinx.android.synthetic.main.*

public class MyActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.main)

        // Instead of findView(R.id.textView) as TextView
        textView.setText("Hello, world!")
    }
}
```

그런데, 전 안되네요...

---
# 트러블슈팅
## `NotFoundException`
- `<YOURS>.java` > `<YOURS>.kotlin` 했을 때

- 다시 빌드!!!

## `KotlinFrontEndException`
- `R.drawable.***`등의 리소스 오류?

- `git clean -f -x -d` > 다시 프로젝트 임포트!

- https://youtrack.jetbrains.com/issue/KT-6625

---
# 트러블슈팅

## `Build.VERSION_CODES.***`
- 그냥 `숫자`로...

- https://youtrack.jetbrains.com/issue/KT-6818

## 프로가드 (쿨하게 전부 keep)
```
-keep class kotlin.** { *; }
-keep class org.jetbrains.kotlin.** { *; }
-keep class com.intellij.** { *; }
-dontwarn kotlin.**,org.jetbrains.kotlin.**,com.intellij.**
```

---
class: center, middle, inverse2

# Conclusion

## It's up to you 😅

---
class: center, middle, inverse1

# References

---
# 온라인 데모
- http://kotlin-demo.jetbrains.com/

<iframe src="http://kotlin-demo.jetbrains.com/"
        frameborder="0"height="100%" width="100%">
</iframe>

---
# Kotlin vs. Java/Scala

## [자바와 비교][comp_java]
## [스칼라와 비교][comp_scala]

---
# Kotlin Korea 🇰🇷

## https://www.facebook.com/kotlinkr

---
name: last-page
class: center, middle

# Any Questions? 🙋

---
name: last-page
class: center, middle

# Thank you 😆

[eclipse]: http://blog.jetbrains.com/kotlin/2015/03/eclipse-plugin-alpha-is-out/
[comp_java]: http://kotlinlang.org/docs/reference/comparison-to-java.html
[comp_scala]: http://kotlinlang.org/docs/reference/comparison-to-scala.html
[anko_popular]: https://github.com/importre/popular/blob/0.1.0_2/app/src/main/kotlin/io/github/importre/popular/MainActivity.kt#L50-L86
