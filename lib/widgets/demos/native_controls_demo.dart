import 'package:flutter/material.dart';
import 'package:cupertino_native/cupertino_native.dart';
import '../shared/ios26_background.dart';
import '../shared/liquid_glass_container.dart';

/// 1. ネイティブコントロールのデモ
/// CNSlider, CNSwitch, CNSegmentedControlの使用例
class NativeControlsDemo extends StatefulWidget {
  const NativeControlsDemo({super.key});

  @override
  State<NativeControlsDemo> createState() => _NativeControlsDemoState();
}

class _NativeControlsDemoState extends State<NativeControlsDemo> {
  double _sliderValue = 50;
  bool _switchValue = true;
  int _segmentIndex = 0;

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
                      const Row(
                        children: [
                          CNIcon(symbol: CNSymbol('slider.horizontal.3')),
                          SizedBox(width: 8),
                          Text(
                            'ネイティブスライダー',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CNSlider(
                        value: _sliderValue,
                        min: 0,
                        max: 100,
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '値: ${_sliderValue.toStringAsFixed(1)}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                LiquidGlassContainer(
                  child: Row(
                    children: [
                      const CNIcon(symbol: CNSymbol('switch.2')),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ネイティブスイッチ',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'iOS 26 Liquid Glassトグル',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CNSwitch(
                        value: _switchValue,
                        onChanged: (value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CNIcon(symbol: CNSymbol('rectangle.3.group')),
                          SizedBox(width: 8),
                          Text(
                            'セグメントコントロール',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      CNSegmentedControl(
                        labels: const ['日', '週', '月', '年'],
                        selectedIndex: _segmentIndex,
                        onValueChanged: (index) {
                          setState(() {
                            _segmentIndex = index;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        '選択: ${['日', '週', '月', '年'][_segmentIndex]}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
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
