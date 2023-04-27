import 'package:admission_plus/dbHelper/MongoDb.dart';
import 'package:admission_plus/providers/college_user_provider.dart';
import 'package:admission_plus/providers/user_provider.dart';
import 'package:admission_plus/screens/student/HomeScreen.dart';
import 'package:admission_plus/screens/student/StudentProfile.dart';
import 'package:admission_plus/screens/TabsScreen.dart';
import 'package:admission_plus/services/auth_services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>UserProvider()),ChangeNotifierProvider(create: (_)=>CollegeUserProvider())], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admission Plus',
      theme: ThemeData(
          primarySwatch: buildMaterialColor(Color.fromRGBO(39, 58, 150, 1)),
          backgroundColor: Colors.black,
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Raleway',
                  color: buildMaterialColor(Color.fromRGBO(39, 58, 150, 1))))),
      home: SplashScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        StudentProfile.routeName: (ctx) => StudentProfile(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService authService= AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Center(
          child: Image.asset("assets/ADMISSI.png"),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        splashIconSize: 240,
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        nextScreen:Provider.of<UserProvider>(context).user.token!.isEmpty ? TabsScreen(): const HomeScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home Page"),
      ),
      body: Center(
        child: Column(children: []),
      ),
    );
  }
}
