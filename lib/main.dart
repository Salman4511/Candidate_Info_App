import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_app/controllers/auth_controller.dart';
import 'package:form_app/views/auth/login_screen.dart';
import 'package:form_app/views/home/candidate_details_screen.dart';
import 'package:form_app/views/home/candidate_list_screen.dart';
import 'package:form_app/views/home/form_screen.dart';
import 'package:form_app/views/landing_screen/landing_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBHqt2EwIcHYbvQTBTxjPmN5uGFSo41ZjU',
      appId: '1:1056188127365:android:0a4f75710cf70dde91f1ec',
      messagingSenderId: '1056188127365',
      projectId: 'form-app-444c4',
    ),
  );

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
          '/form': (context) => const FormScreen(),
          '/landing':(context)=> const LandingScreen(),
          '/candidateList':(context)=>CandidateListScreen(),
        },
      ),
    );
  }
}
