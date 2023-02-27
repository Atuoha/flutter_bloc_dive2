import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

const kAPIHost = 'api.openweathermap.org';
const kIconUrl = 'www.openweathermap.org';
const kLimit = '1';
const kUnit = 'metric';
const kMinMax = 20;
// https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}
// https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
// http://openweathermap.org/img/wn/10d@2x.png
// https://openweathermap.org/weather-conditions
// https://openweathermap.org/current

// Auth
var primaryColor = const Color(0xFF2196F3);
var secondaryColor = const Color(0xFF3F3D56);
final userRef = FirebaseFirestore.instance.collection('users');

