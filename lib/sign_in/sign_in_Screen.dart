import 'package:flutter/material.dart';
import 'package:tugas_kelas/home/home.dart';

import 'package:tugas_kelas/app/core/component/app_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Pastikan warna ini terdefinisi
      body: Stack(
        children: [
          SizedBox(
            height: 213,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2, 
                child: Image.asset("assets/logo_white.png"), 
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 44),
                      const Text(
                        'Email',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(hintText: 'Email Loket'),
                      ),
                      const SizedBox(height: 36),
                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Password',
                          suffixIcon: Icon(Icons.visibility),
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: AppButton(
                          label: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, '/home'); 
                          },
                        ),
                      ),
                      const SizedBox(height: 128),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/logo_cwb.png', 
                          height: 40,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
