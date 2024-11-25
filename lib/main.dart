
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sgibook/provider/cal_provider.dart';
import 'package:sgibook/provider/keyboard.dart';
import 'package:sgibook/view/add_customer.dart';
import 'package:sgibook/view/auth_screen/phone_auth.dart';
import 'package:sgibook/view/auth_screen/select_language.dart';
import 'package:sgibook/home/home_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => KeyboardVisibilityNotifier()),
        ChangeNotifierProvider(create: (context) => CalculatorProvider()), // Add your CalculatorProvider here
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:HomePage(), // Change this to your desired starting screen
      ),
    );
  }
}