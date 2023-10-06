import 'package:en_learn/screens/ai_translate_screen.dart';
import 'package:en_learn/screens/screens.dart';
import 'package:en_learn/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() )
      ],
      child: const MyApp(),
      );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CbaTalk",
      initialRoute: 'ai_translate',
      navigatorKey: navigatorKey,
      routes: {
        'check_auth_screen': ( _ ) => const CheckAuthScreen(),
        'login': ( _ ) => const LoginScreen(),
        'home':( _ ) => const RoutesApp() ,
        'ai_translate':(_) => const AiTranslateScreen() 
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color.fromRGBO(102, 192, 100, 1),
      ),
    );
  }
}