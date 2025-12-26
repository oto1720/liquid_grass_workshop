import 'package:flutter/material.dart';
import 'package:cupertino_native/cupertino_native.dart';
import '../shared/ios26_background.dart';
import '../shared/liquid_glass_container.dart';
import '../shared/symbol_card.dart';

/// 4. SF Symbolsのデモ
/// iOS 26のシンボルとレンダリングモード
class SFSymbolsDemo extends StatelessWidget {
  const SFSymbolsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const iOS26Background(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'マルチカラーシンボル',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          SymbolCard(
                            symbol: CNSymbol('paintpalette.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: 'パレット',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('heart.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: 'ハート',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('star.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: '星',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('cloud.sun.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: '天気',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '階層的シンボル',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          SymbolCard(
                            symbol: CNSymbol('battery.100'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: 'バッテリー',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('wifi'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: 'WiFi',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('speaker.wave.3.fill'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: '音量',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('bell.fill'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: '通知',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'モノクロシンボル',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: const [
                          SymbolCard(
                            symbol: CNSymbol('house.fill'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: 'ホーム',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('person.crop.circle'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: 'プロフィール',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('gearshape.fill'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: '設定',
                          ),
                          SymbolCard(
                            symbol: CNSymbol('magnifyingglass'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: '検索',
                          ),
                        ],
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
