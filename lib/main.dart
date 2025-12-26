import 'dart:ui';
import 'package:flutter/material.dart';
import 'liquid.dart';
import 'curpertino.dart';
import 'liquid_glass.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquid Glass Workshop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 背景グラデーション
          Container(
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
          ),
          // メインコンテンツ
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  // タイトル
                  const Text(
                    'リキッドグラス',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'iOS 26 デザインワークショップ 2025',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // デモカード1: Liquid Glass Effects
                  _DemoCard(
                    title: 'リキッドグラス エフェクト',
                    subtitle: 'BackdropFilter & Renderer',
                    description:
                        '4つの実装方法：Renderer、Backdrop Filter、iOS 26スタイル、高度なエフェクト',
                    icon: Icons.water_drop,
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.3),
                        Colors.cyan.withOpacity(0.2),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LiquidGlass(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // デモカード2: Cupertino Native
                  _DemoCard(
                    title: 'Cupertino Native',
                    subtitle: 'ネイティブiOS 26 コントロール',
                    description:
                        'UIKit/AppKitのネイティブコントロール：スライダー、スイッチ、ボタン、SF Symbols',
                    icon: Icons.apple,
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple.withOpacity(0.3),
                        Colors.pink.withOpacity(0.2),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const CupertinoNativeLiquidGlass(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  // デモカード3: Liquid Glass Card
                  _DemoCard(
                    title: 'Liquid Glass Card',
                    subtitle: 'とろけるガラスカード',
                    description:
                        'Dynamic Island風のぷにぷに揺れる液体ガラスエフェクト：CustomPainter、複数の波動、曲率計算',
                    icon: Icons.water_drop,
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal.withOpacity(0.3),
                        Colors.green.withOpacity(0.2),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LiquidGlassDemo(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                  // フッター情報
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.info_outline,
                                color: Colors.white70, size: 20),
                            SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'iOS 26のLiquid Glassデザインを体験',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// デモカード
class _DemoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Gradient gradient;
  final VoidCallback onTap;

  const _DemoCard({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.25),
                  Colors.white.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1.5,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        gradient: gradient,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Icon(icon, color: Colors.white, size: 28),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white70,
                      size: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.8),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}