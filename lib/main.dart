import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_app/controllers/auth_controller.dart';
import 'package:form_app/views/auth/login_screen.dart';
import 'package:form_app/views/home/form_screen.dart';
import 'package:form_app/views/landing_screen/landing_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Form App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const LandingScreen(),
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const FormScreen(),
        },
      ),
    );
  }
}
