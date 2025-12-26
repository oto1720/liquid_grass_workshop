import 'dart:math';
import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

/// とろけるガラスカード（liquid_glass_renderer 使用）
///
/// LiquidGlassRenderer パッケージを使用して、
/// Dynamic Island 風のぷにぷに揺れるガラスエフェクトを実装
class LiquidGlassCard extends StatefulWidget {
  final Widget? child;
  final double width;
  final double height;

  const LiquidGlassCard({
    super.key,
    this.child,
    this.width = 300,
    this.height = 180,
  });

  @override
  State<LiquidGlassCard> createState() => _LiquidGlassCardState();
}

class _LiquidGlassCardState extends State<LiquidGlassCard>
    with TickerProviderStateMixin {
  late AnimationController _morphController;
  late AnimationController _scaleController;
  late AnimationController _glowController;

  late Animation<double> _morphAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // 形状変形アニメーション（ゆっくり）
    _morphController = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );

    // スケールアニメーション（ぷにぷに感）
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 2800),
      vsync: this,
    );

    // グローアニメーション
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _morphAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _morphController, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOutSine),
    );

    _morphController.repeat(reverse: true);
    _scaleController.repeat(reverse: true);
    _glowController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _morphController.dispose();
    _scaleController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _morphController,
        _scaleController,
        _glowController,
      ]),
      builder: (context, child) {
        // Dynamic Island風の角丸を動的に変化
        final borderRadius = 40.0 + (_morphAnimation.value * 10);

        return Transform.scale(
          scale: _scaleAnimation.value,
          child: LiquidStretch(
            // インタラクティブな変形エフェクト
            stretch: 0.3,
            child: LiquidGlassLayer(
              settings: LiquidGlassSettings(
                // ガラスの色（ティント）
                glassColor: Colors.white.withOpacity(0.2),
                // 屈折の強さ（厚み）
                thickness: 8.0 + (_morphAnimation.value * 4),
                // 背景のぼかし強度
                blur: 20.0,
                // 屈折率（ガラスの素材感）
                refractiveIndex: 1.5,
                // 光源の角度
                lightAngle: _morphController.value * 2 * pi,
                // 光の強度
                lightIntensity: 0.6,
                // 環境光の強さ
                ambientStrength: 0.3,
                // 彩度調整
                saturation: 1.2,
              ),
              child: GlassGlowLayer(
                child: GlassGlow(
                  // タッチレスポンシブなグローエフェクト
                  glowRadius: 0.3 + (_glowController.value * 0.2),
                  glowColor: Colors.white.withOpacity(0.4),
                  child: LiquidGlass(
                    shape: LiquidRoundedSuperellipse(
                      borderRadius: borderRadius,
                    ),
                    child: SizedBox(
                      width: widget.width,
                      height: widget.height,
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// 複数のガラス形状をブレンドするデモ
class LiquidGlassBlendDemo extends StatefulWidget {
  const LiquidGlassBlendDemo({super.key});

  @override
  State<LiquidGlassBlendDemo> createState() => _LiquidGlassBlendDemoState();
}

class _LiquidGlassBlendDemoState extends State<LiquidGlassBlendDemo>
    with TickerProviderStateMixin {
  late AnimationController _floatController1;
  late AnimationController _floatController2;
  late AnimationController _floatController3;

  @override
  void initState() {
    super.initState();

    _floatController1 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _floatController2 = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    )..repeat(reverse: true);

    _floatController3 = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _floatController1.dispose();
    _floatController2.dispose();
    _floatController3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 250,
      child: LiquidGlassLayer(
        settings: const LiquidGlassSettings(
          glassColor: Color.fromARGB(76, 255, 255, 255),
          thickness: 10,
          blur: 25,
          refractiveIndex: 1.5,
          lightIntensity: 0.7,
        ),
        child: LiquidGlassBlendGroup(
          blend: 20.0,
          child: Stack(
            children: [
              // 1つ目のガラス形状
              AnimatedBuilder(
                animation: _floatController1,
                builder: (context, child) {
                  final offset = sin(_floatController1.value * 2 * pi) * 20;
                  return Positioned(
                    left: 50 + offset,
                    top: 50,
                    child: LiquidGlass.grouped(
                      shape: const LiquidOval(),
                      child: const SizedBox(width: 120, height: 120),
                    ),
                  );
                },
              ),

              // 2つ目のガラス形状
              AnimatedBuilder(
                animation: _floatController2,
                builder: (context, child) {
                  final offset = cos(_floatController2.value * 2 * pi) * 25;
                  return Positioned(
                    left: 180,
                    top: 70 + offset,
                    child: LiquidGlass.grouped(
                      shape: LiquidRoundedSuperellipse(borderRadius: 35),
                      child: const SizedBox(width: 100, height: 100),
                    ),
                  );
                },
              ),

              // 3つ目のガラス形状
              AnimatedBuilder(
                animation: _floatController3,
                builder: (context, child) {
                  final offsetX = sin(_floatController3.value * 2 * pi) * 15;
                  final offsetY = cos(_floatController3.value * 2 * pi) * 15;
                  return Positioned(
                    left: 120 + offsetX,
                    top: 120 + offsetY,
                    child: LiquidGlass.grouped(
                      shape: LiquidRoundedRectangle(borderRadius: 25),
                      child: const SizedBox(width: 90, height: 90),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// デモページ
class LiquidGlassDemo extends StatelessWidget {
  const LiquidGlassDemo({super.key});

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

          // LiquidGlassLayer（必須の親ウィジェット）
          LiquidGlassLayer(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ヘッダー
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Liquid Glass Card',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),

                    // メインカード
                    const LiquidGlassCard(
                      width: 320,
                      height: 180,
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.water_drop,
                              color: Colors.white,
                              size: 40,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Liquid Glass',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Dynamic Island風',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // 小さいバージョン
                    const LiquidGlassCard(
                      width: 200,
                      height: 120,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 32,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Small Card',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    // セクション: 液体ブレンド
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '液体ブレンド',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '複数のガラス形状が溶け合うエフェクト',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // ブレンドデモ
                          const Center(
                            child: LiquidGlassBlendDemo(),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 50),

                    // 技術情報
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Text(
                              '技術要素',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'LiquidGlass • LiquidStretch • GlassGlow\n'
                              'LiquidGlassBlendGroup • GPUシェーダー\n'
                              'リアルタイム屈折 • 動的な光源\n'
                              'インタラクティブな変形',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.8),
                                height: 1.6,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
