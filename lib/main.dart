import 'package:chat_gpt_02/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: ".env");
//   runApp(const MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // dotenv.get('apikey', fallback: "API_KEY NOT FOUND");

  // final apiKey = dotenv.env['apikey'];
  // print(apiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Medical Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: homePage(),
    );
  }
}
