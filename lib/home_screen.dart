import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, this.profile, {super.key});

  final void Function() startQuiz;
  final void Function() profile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 180,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Quiz App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
            ),
          ),
          const Text(
            'praktikummobile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // Tombol untuk memulai kuis
          TextButton(
            onPressed: startQuiz,
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_right_alt),
                SizedBox(width: 8),
                Text('Start Quiz'),
              ],
            ),
          ),
          const SizedBox(height: 10), // Tambahkan sedikit jarak
          // Tombol untuk pindah ke profil
          TextButton(
            onPressed:
                profile, // Gunakan fungsi profile untuk navigasi ke layar Profile
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.deepPurple,
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text('Profile'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
