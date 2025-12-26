import 'package:flutter/material.dart';
import 'package:cupertino_native/cupertino_native.dart';
import '../shared/ios26_background.dart';
import '../shared/liquid_glass_container.dart';
import '../shared/stat_card.dart';
import '../shared/feature_row.dart';

/// 2. Liquid Glassレイアウトのデモ
/// 複数のガラスカードを組み合わせたレイアウト例
class LiquidGlassLayoutDemo extends StatelessWidget {
  const LiquidGlassLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const iOS26Background(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        icon: const CNSymbol('chart.line.uptrend.xyaxis'),
                        title: '成長率',
                        value: '24.5%',
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        icon: const CNSymbol('person.2.fill'),
                        title: 'ユーザー',
                        value: '1.2K',
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        icon: const CNSymbol('star.fill'),
                        title: '評価',
                        value: '4.8',
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: StatCard(
                        icon: const CNSymbol('heart.fill'),
                        title: 'いいね',
                        value: '956',
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const CNIcon(
                              symbol: CNSymbol('apple.logo'),
                              mode: CNSymbolRenderingMode.multicolor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'iOS 26',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'リキッドグラスデザイン',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.white24),
                      const SizedBox(height: 20),
                      const Text(
                        '機能',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const FeatureRow(
                        icon: CNSymbol('checkmark.circle.fill'),
                        text: 'ネイティブUIKit/AppKitコントロール',
                      ),
                      const FeatureRow(
                        icon: CNSymbol('checkmark.circle.fill'),
                        text: 'Platform Views統合',
                      ),
                      const FeatureRow(
                        icon: CNSymbol('checkmark.circle.fill'),
                        text: 'ピクセルパーフェクトな忠実度',
                      ),
                      const FeatureRow(
                        icon: CNSymbol('checkmark.circle.fill'),
                        text: 'リアクティブで動的なエフェクト',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
