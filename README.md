# Multiavatar Plus #

<img src="https://raw.githubusercontent.com/multiavatar/Multiavatar/main/logo.png?v=001" width="65">

> **Fork notice:** `multiavatar_plus` is a maintained fork of the original
> [`multiavatar`](https://pub.dev/packages/multiavatar) package
> ([X-SLAYER/Multiavatar](https://github.com/X-SLAYER/Multiavatar)), which is no
> longer being updated. Same API, kept current with recent Flutter/Dart SDKs.
> Published from [nemr0/multiavatar_plus](https://github.com/nemr0/multiavatar_plus).

Flutter Wrapper for [Multiavatar](https://multiavatar.com)

[Multiavatar](https://multiavatar.com) is a multicultural avatar maker.

Multiavatar represents people from multiple races, multiple cultures, multiple age groups, multiple worldviews and walks of life.

In total, it is possible to generate **12,230,590,464** unique avatars.



### Installation and usage ###

Add multiavatar_plus to your pubspec:

```yaml
dependencies:
  multiavatar_plus: any # or the latest version on Pub
```

```dart
import 'package:multiavatar_plus/multiavatar_plus.dart';
```

```dart
var svgCode = multiavatar('X-SLAYER')
```
avatar with transparent background

```dart
var svgCode = multiavatar('X-SLAYER', trBackground: true);
```

check the exemple of using multiavatar with svg package [Multiavatar + svg package](https://github.com/X-SLAYER/multiavatar-exemple)

### Info ###

To create new avatars, the Multiavatar mixes different parts of different avatars, and different color themes.

The total number of unique avatars: 48^6 = 12,230,590,464

One of the main Multiavatar functions is to work as an identicon. Every unique avatar can be identified by the unique string of characters, associated with the avatar.

The string of characters is also the input for the Multiavatar package, which converts the provided string into a 6 double-digit numbers (range 00-47), each representing an individual part of the final avatar.

`000000000000` - this string of numbers represents the very first avatar + its A theme. You can also read it like this: `00 00 00 00 00 00`.

`474747474747` - this is the 12,230,590,464th avatar (or the 16th initial avatar + its "C" color theme).

More info can be found in the `multiavatar.dart` file comments.



### License ###


A Dart implementation based on [Multiavatar](https://github.com/multiavatar) script for Flutter apps.


### Screenshots ###

<img src="https://multiavatar.com/press/img/screenshots/screenshot-02.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-03.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-09.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-10.png?v=001">


## Visitors Count

<img align="left" src = "https://profile-counter.glitch.me/Multiavatar/count.svg" alt ="Loading">