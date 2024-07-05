import 'dart:io';

import 'package:flutter/material.dart';

// const apiUrl = String.fromEnvironment('baseUrl', defaultValue: 'https://10.0.2.2:7056');
const apiUrl =
    String.fromEnvironment('baseUrl', defaultValue: 'http://10.0.2.2:7056');

const stripePublishKey = String.fromEnvironment('stripePublishKey',
    defaultValue:
        'pk_test_51OZcIgJakb96Ych39tUxnt3bcnR6doEieDIly9hO3qKZvzXCcX1YWtq6Y1bSX1ZaEbUmfxaTuAGHWr8JN8PCi3dJ00T678putE');
const stripeSecretKey = String.fromEnvironment('stripeSecretKey',
    defaultValue:
        'sk_test_51OZcIgJakb96Ych3a73oti4ToMASIFA3zzypns6XMIEYMqKVZgEAMZUaDf7BdZc7XhE0Gt7m9eJfa29BpnXrKZAX00yFHN558A');

const kPrimaryColor = Color(0xff653090);
const kEventPrimaryColor = Colors.blue;
const kBackgroundColor = Color.fromARGB(255, 43, 46, 49);
const kRedishColor = Color.fromRGBO(254, 52, 86, 1);
const kDarkGreyColor = Color(0xFF5E5E5E);

Color get primary => const Color(0XFF12B422);
Color get teal => Colors.teal;
Color get white => Colors.white;
Color get black => Colors.black;
const kDefaultElevation = 2.0;

const kBodyPadding = EdgeInsets.symmetric(horizontal: Sizes.p8);

final kBodySafeAreaPadding = EdgeInsets.only(
  right: Sizes.p12,
  left: Sizes.p12,
  bottom: Platform.isAndroid ? kAndroidBottomOffset : kIOSBottomOffset,
);
final kSafeAreaBottomMargin = EdgeInsets.only(
    bottom: Platform.isAndroid ? kAndroidBottomOffset : kIOSBottomOffset);

const kContentTopMargin = SizedBox(height: Sizes.p8);
const kAndroidBottomOffset = 64.0;
const kIOSBottomOffset = 108.0;

final kBoxShadowList = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 0.5,
    blurRadius: 0.5,
    offset: const Offset(0, 1),
  ),
];

class Sizes {
  static const p2 = 2.0;
  static const p4 = 4.0;
  static const p5 = 5.0;
  static const p6 = 6.0;
  static const p8 = 8.0;
  static const p10 = 10.0;
  static const p12 = 12.0;
  static const p14 = 14.0;
  static const p16 = 16.0;
  static const p18 = 18.0;
  static const p20 = 20.0;
  static const p24 = 24.0;
  static const p28 = 28.0;
  static const p30 = 30.0;
  static const p32 = 32.0;
  static const p36 = 36.0;
  static const p40 = 40.0;
  static const p44 = 44.0;
  static const p48 = 48.0;
  static const p52 = 52.0;
  static const p54 = 54.0;
  static const p56 = 56.0;
  static const p60 = 60.0;
  static const p64 = 64.0;
  static const p80 = 80.0;
  static const p100 = 100.0;
  static const p150 = 150.0;
  static const p250 = 250.0;
}

const gapW4 = SizedBox(width: Sizes.p4);
const gapW8 = SizedBox(width: Sizes.p8);
const gapW12 = SizedBox(width: Sizes.p12);
const gapW16 = SizedBox(width: Sizes.p16);
const gapW18 = SizedBox(width: Sizes.p18);
const gapW20 = SizedBox(width: Sizes.p20);
const gapW24 = SizedBox(width: Sizes.p24);
const gapW32 = SizedBox(width: Sizes.p32);
const gapW48 = SizedBox(width: Sizes.p48);
const gapW64 = SizedBox(width: Sizes.p64);

const gapH4 = SizedBox(height: Sizes.p4);
const gapH6 = SizedBox(height: Sizes.p6);
const gapH8 = SizedBox(height: Sizes.p8);
const gapH12 = SizedBox(height: Sizes.p12);
const gapH16 = SizedBox(height: Sizes.p16);
const gapH20 = SizedBox(height: Sizes.p20);
const gapH24 = SizedBox(height: Sizes.p24);
const gapH32 = SizedBox(height: Sizes.p32);
const gapH48 = SizedBox(height: Sizes.p48);
const gapH54 = SizedBox(height: Sizes.p54);
const gapH56 = SizedBox(height: Sizes.p56);
const gapH64 = SizedBox(height: Sizes.p64);

const floatingActionButtonOffset = SizedBox(height: Sizes.p52);
