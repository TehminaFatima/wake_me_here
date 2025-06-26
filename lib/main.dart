import 'package:flutter/material.dart';
import 'wake_me_here.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load();
  runApp(WakeMeHereApp());
}
