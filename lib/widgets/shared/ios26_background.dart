import 'package:flutter/material.dart';

/// iOS 26スタイルの背景グラデーション
class iOS26Background extends StatelessWidget {
  const iOS26Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF667eea),
            Color(0xFF764ba2),
            Color(0xFFf093fb),
            Color(0xFF4facfe),
          ],
        ),
      ),
    );
  }
}
