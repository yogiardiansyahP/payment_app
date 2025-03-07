import 'package:flutter/material.dart';
import 'package:tugas_kelas/home/home.dart';
import 'package:tugas_kelas/sign_in/sign_in_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/sign-in': (context) => const SignInScreen(), 
         '/home': (context) =>  TicketPurchasePage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/sign-in');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Stack(
      //   children: [
      //     Align(
      //       alignment: Alignment.center,
      //       child: Image.asset(AssetsConst.logoBlue),
      //     ),
      //     Align(
      //       alignment: Alignment.bottomCenter,
      //       child: Image.asset(AssetsConst.fromLogo),
      //     ),
      //   ],
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Image.asset( 'assets/logo_blue.png'),
            Spacer(),
            Image.asset( 'assets/from_logo.png'),
          ],
        ),
      ),
    );
  }
}
