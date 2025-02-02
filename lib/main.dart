import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucky_flutter/firebase_options.dart';
import 'app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  runApp(const ProviderScope(child: LuckyFlutterApp()));
}

// build the app:
// flutter run -d chrome --web-renderer canvaskit --web-browser-flag '--disable-web-security' -t lib/main.dart --release