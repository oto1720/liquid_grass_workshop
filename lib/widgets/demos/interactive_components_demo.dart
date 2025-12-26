import 'package:flutter/material.dart';
import 'package:cupertino_native/cupertino_native.dart';
import '../shared/ios26_background.dart';
import '../shared/liquid_glass_container.dart';

/// 3. インタラクティブコンポーネントのデモ
/// CNButton, CNPopupMenuButtonの使用例
class InteractiveComponentsDemo extends StatefulWidget {
  const InteractiveComponentsDemo({super.key});

  @override
  State<InteractiveComponentsDemo> createState() =>
      _InteractiveComponentsDemoState();
}

class _InteractiveComponentsDemoState
    extends State<InteractiveComponentsDemo> {
  String _lastAction = 'なし';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const iOS26Background(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ネイティブボタン',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CNButton(
                        label: 'プライマリアクション',
                        onPressed: () {
                          setState(() {
                            _lastAction = 'プライマリアクションが押されました';
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CNButton.icon(
                        icon: const CNSymbol('heart.fill'),
                        onPressed: () {
                          setState(() {
                            _lastAction = 'ハートボタンが押されました';
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CNButton(
                        label: 'ダウンロード',
                        onPressed: () {
                          setState(() {
                            _lastAction = 'ダウンロードを開始しました';
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
                      const Text(
                        'ポップアップメニュー',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CNPopupMenuButton(
                        buttonLabel: 'アクション',
                        items: const [
                          CNPopupMenuItem(
                            label: '新規ファイル',
                            icon: CNSymbol('doc', size: 18),
                          ),
                          CNPopupMenuItem(
                            label: '開く',
                            icon: CNSymbol('folder', size: 18),
                          ),
                          CNPopupMenuDivider(),
                          CNPopupMenuItem(
                            label: '名前変更',
                            icon: CNSymbol(
                              'rectangle.and.pencil.and.ellipsis',
                              size: 18,
                            ),
                          ),
                          CNPopupMenuItem(
                            label: '削除',
                            icon: CNSymbol('trash', size: 18),
                          ),
                        ],
                        onSelected: (index) {
                          final actions = [
                            '新規ファイル',
                            '開く',
                            null,
                            '名前変更',
                            '削除'
                          ];
                          if (actions[index] != null) {
                            setState(() {
                              _lastAction = '${actions[index]}が選択されました';
                            });
                          }
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
                          CNIcon(symbol: CNSymbol('info.circle.fill')),
                          SizedBox(width: 8),
                          Text(
                            '最後のアクション',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _lastAction,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
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
