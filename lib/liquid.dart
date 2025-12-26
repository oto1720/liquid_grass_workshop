import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart' as lgr;

/// Liquid Glassエフェクトのデモページ（2025年版）
/// iOS 26のLiquid Glassデザインを含む、最新の実装手法を網羅
class LiquidGlass extends StatefulWidget {
  const LiquidGlass({super.key});

  @override
  State<LiquidGlass> createState() => _LiquidGlassState();
}

class _LiquidGlassState extends State<LiquidGlass> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liquid Glass Effects 2025'),
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          _LiquidGlassRendererExample(),
          _BackdropFilterExample(),
          _iOS26LiquidGlassExample(),
          _AdvancedGlassEffectsExample(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.view_in_ar),
            label: 'Renderer',
          ),
          NavigationDestination(
            icon: Icon(Icons.blur_on),
            label: 'Backdrop',
          ),
          NavigationDestination(
            icon: Icon(Icons.apple),
            label: 'iOS 26',
          ),
          NavigationDestination(
            icon: Icon(Icons.auto_awesome),
            label: 'Advanced',
          ),
        ],
      ),
    );
  }
}

/// 1. liquid_glass_rendererパッケージを使った実装
/// 特徴：高度な屈折、色収差、光の効果
/// 制約：Impellerのみ対応（Web/Windows/Linuxは非対応）
class _LiquidGlassRendererExample extends StatelessWidget {
  const _LiquidGlassRendererExample();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 背景コンテンツ
        _GradientBackground(),
        // ガラスエフェクト
        Center(
          child: lgr.LiquidGlassLayer(
            settings: const lgr.LiquidGlassSettings(
              thickness: 20,
              blur: 10,
              glassColor: Color(0x33FFFFFF),
              lightIntensity: 0.6,
              ambientStrength: 0.2,
              chromaticAberration: 0.02,
              refractiveIndex: 1.3,
              saturation: 1.2,
            ),
            child: lgr.LiquidGlass(
              shape: const lgr.LiquidRoundedSuperellipse(
                borderRadius: 30,
              ),
              child: Container(
                width: 280,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.water_drop, size: 48, color: Colors.white),
                      SizedBox(height: 12),
                      Text(
                        'Liquid Glass',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Advanced Renderer',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 2. BackdropFilterを使った純粋なFlutter実装
/// 特徴：外部パッケージ不要、全プラットフォーム対応
/// 推奨：Flutter SDK 3.10+
class _BackdropFilterExample extends StatelessWidget {
  const _BackdropFilterExample();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 背景コンテンツ
        _GradientBackground(),
        // BackdropFilterを使ったガラスエフェクト
        Center(
          child: RepaintBoundary(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: 280,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.blur_circular, size: 48, color: Colors.white),
                        SizedBox(height: 12),
                        Text(
                          'Backdrop Filter',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Pure Flutter Implementation',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 3. iOS 26スタイルのモダンなLiquid Glass
/// 特徴：Apple風のドリーミーな質感、深みのあるガラス表現
/// 2025年のトレンドに基づいた実装
class _iOS26LiquidGlassExample extends StatelessWidget {
  const _iOS26LiquidGlassExample();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // iOS風の背景
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF667eea),
                Color(0xFF764ba2),
                Color(0xFFf093fb),
              ],
            ),
          ),
        ),
        // 装飾的な背景要素
        Positioned(
          top: 100,
          left: 50,
          child: _FloatingCircle(size: 150, color: Colors.cyan.withOpacity(0.3)),
        ),
        Positioned(
          bottom: 150,
          right: 30,
          child: _FloatingCircle(size: 200, color: Colors.pink.withOpacity(0.3)),
        ),
        // iOS 26スタイルのガラスカード
        Center(
          child: RepaintBoundary(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  width: 320,
                  height: 220,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.25),
                        Colors.white.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.apple,
                          size: 56,
                          color: Colors.white,
                        ),
                        const Spacer(),
                        const Text(
                          'iOS 26',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Liquid Glass Design',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.9),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// 4. 高度なガラスエフェクトの組み合わせ
/// 複数のガラス要素、異なるblur値、パフォーマンス最適化の例
class _AdvancedGlassEffectsExample extends StatelessWidget {
  const _AdvancedGlassEffectsExample();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _GradientBackground(),
        // 複数のガラスカードを配置
        Positioned(
          top: 80,
          left: 20,
          child: _GlassCard(
            width: 160,
            height: 120,
            blurSigma: 8,
            opacity: 0.2,
            child: const Center(
              child: Text(
                'Blur: 8',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        Positioned(
          top: 80,
          right: 20,
          child: _GlassCard(
            width: 160,
            height: 120,
            blurSigma: 15,
            opacity: 0.15,
            child: const Center(
              child: Text(
                'Blur: 15',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 150,
          left: 40,
          child: _GlassCard(
            width: 140,
            height: 140,
            blurSigma: 25,
            opacity: 0.1,
            borderRadius: 70,
            child: const Center(
              child: Icon(Icons.star, size: 40, color: Colors.white),
            ),
          ),
        ),
        // メインの大きなガラスカード
        Center(
          child: _GlassCard(
            width: 300,
            height: 200,
            blurSigma: 20,
            opacity: 0.18,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.layers, size: 48, color: Colors.white),
                  SizedBox(height: 12),
                  Text(
                    'Advanced Effects',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Multiple glass layers\nwith RepaintBoundary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ===== ユーティリティウィジェット =====

/// 再利用可能なグラデーション背景
class _GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4facfe),
            Color(0xFF00f2fe),
            Color(0xFF43e97b),
          ],
        ),
      ),
      child: Center(
        child: Opacity(
          opacity: 0.3,
          child: Icon(
            Icons.wallpaper,
            size: 200,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

/// パフォーマンス最適化されたガラスカード
/// RepaintBoundaryで分離し、不要な再描画を防止
class _GlassCard extends StatelessWidget {
  final double width;
  final double height;
  final double blurSigma;
  final double opacity;
  final double borderRadius;
  final Widget child;

  const _GlassCard({
    required this.width,
    required this.height,
    required this.blurSigma,
    required this.opacity,
    this.borderRadius = 20,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

/// 装飾用の浮遊する円
class _FloatingCircle extends StatelessWidget {
  final double size;
  final Color color;

  const _FloatingCircle({
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}