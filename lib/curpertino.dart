import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cupertino_native/cupertino_native.dart';

/// cupertino_native�c_Liquid Glass��2025tH	
/// iOS 26nͤƣ�Liquid Glass����(
/// Platform ViewshMethod Channelsg,inUIKit/AppKit������ˁ��
class CupertinoNativeLiquidGlass extends StatefulWidget {
  const CupertinoNativeLiquidGlass({super.key});

  @override
  State<CupertinoNativeLiquidGlass> createState() =>
      _CupertinoNativeLiquidGlassState();
}

class _CupertinoNativeLiquidGlassState
    extends State<CupertinoNativeLiquidGlass> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Native - iOS 26 Liquid Glass'),
        backgroundColor: Colors.black.withOpacity(0.3),
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: const [
          _NativeControlsDemo(),
          _LiquidGlassLayoutDemo(),
          _InteractiveComponentsDemo(),
          _SFSymbolsDemo(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          border: Border(
            top: BorderSide(
              color: Colors.white.withOpacity(0.2),
              width: 0.5,
            ),
          ),
        ),
        child: CNTabBar(
          items: const [
            CNTabBarItem(
              label: 'Controls',
              icon: CNSymbol('slider.horizontal.3'),
            ),
            CNTabBarItem(
              label: 'Layout',
              icon: CNSymbol('rectangle.3.group'),
            ),
            CNTabBarItem(
              label: 'Interactive',
              icon: CNSymbol('hand.tap.fill'),
            ),
            CNTabBarItem(
              label: 'SF Symbols',
              icon: CNSymbol('paintbrush.fill'),
            ),
          ],
          currentIndex: _selectedTab,
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),
      ),
    );
  }
}

/// 1. ͤƣֳ�����n��
/// CNSlider, CNSwitch, CNSegmentedControln(�
class _NativeControlsDemo extends StatefulWidget {
  const _NativeControlsDemo();

  @override
  State<_NativeControlsDemo> createState() => _NativeControlsDemoState();
}

class _NativeControlsDemoState extends State<_NativeControlsDemo> {
  double _sliderValue = 50;
  bool _switchValue = true;
  int _segmentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // iOS 26�n�o
        _iOS26Background(),
        // ������
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // CNSlider���
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CNIcon(symbol: CNSymbol('slider.horizontal.3')),
                          SizedBox(width: 8),
                          Text(
                            'Native Slider',
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
                        'Value: ${_sliderValue.toStringAsFixed(1)}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // CNSwitch���
                _LiquidGlassContainer(
                  child: Row(
                    children: [
                      const CNIcon(symbol: CNSymbol('switch.2')),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Native Switch',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'iOS 26 Liquid Glass toggle',
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
                // CNSegmentedControl���
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CNIcon(symbol: CNSymbol('rectangle.3.group')),
                          SizedBox(width: 8),
                          Text(
                            'Segmented Control',
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
                        labels: const ['Day', 'Week', 'Month', 'Year'],
                        selectedIndex: _segmentIndex,
                        onValueChanged: (index) {
                          setState(() {
                            _segmentIndex = index;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Selected: ${['Day', 'Week', 'Month', 'Year'][_segmentIndex]}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 2. Liquid Glass줢��n��
/// pn�鹫�ɒD�[_줢�ȋ
class _LiquidGlassLayoutDemo extends StatelessWidget {
  const _LiquidGlassLayoutDemo();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _iOS26Background(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // q���nL
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: const CNSymbol('chart.line.uptrend.xyaxis'),
                        title: 'Growth',
                        value: '24.5%',
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: const CNSymbol('person.2.fill'),
                        title: 'Users',
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
                      child: _StatCard(
                        icon: const CNSymbol('star.fill'),
                        title: 'Rating',
                        value: '4.8',
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: const CNSymbol('heart.fill'),
                        title: 'Likes',
                        value: '956',
                        color: Colors.pink,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // ��n�1���
                Expanded(
                  child: _LiquidGlassContainer(
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
                                    'Liquid Glass Design',
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
                          'Features',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _FeatureRow(
                          icon: const CNSymbol('checkmark.circle.fill'),
                          text: 'Native UIKit/AppKit controls',
                        ),
                        _FeatureRow(
                          icon: const CNSymbol('checkmark.circle.fill'),
                          text: 'Platform Views integration',
                        ),
                        _FeatureRow(
                          icon: const CNSymbol('checkmark.circle.fill'),
                          text: 'Pixel-perfect fidelity',
                        ),
                        _FeatureRow(
                          icon: const CNSymbol('checkmark.circle.fill'),
                          text: 'Reactive & dynamic effects',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 3. ���ƣֳ������n��
/// CNButton, CNPopupMenuButtonn(�
class _InteractiveComponentsDemo extends StatefulWidget {
  const _InteractiveComponentsDemo();

  @override
  State<_InteractiveComponentsDemo> createState() =>
      _InteractiveComponentsDemoState();
}

class _InteractiveComponentsDemoState
    extends State<_InteractiveComponentsDemo> {
  String _lastAction = 'None';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _iOS26Background(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                // CNButtonn��
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Native Buttons',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CNButton(
                        label: 'Primary Action',
                        onPressed: () {
                          setState(() {
                            _lastAction = 'Primary Action pressed';
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CNButton.icon(
                        icon: const CNSymbol('heart.fill'),
                        onPressed: () {
                          setState(() {
                            _lastAction = 'Heart button pressed';
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      CNButton(
                        label: 'Download',
                        onPressed: () {
                          setState(() {
                            _lastAction = 'Download started';
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // CNPopupMenuButtonn��
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Popup Menu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      CNPopupMenuButton(
                        buttonLabel: 'Actions',
                        items: const [
                          CNPopupMenuItem(
                            label: 'New File',
                            icon: CNSymbol('doc', size: 18),
                          ),
                          CNPopupMenuItem(
                            label: 'Open',
                            icon: CNSymbol('folder', size: 18),
                          ),
                          CNPopupMenuDivider(),
                          CNPopupMenuItem(
                            label: 'Rename',
                            icon: CNSymbol(
                              'rectangle.and.pencil.and.ellipsis',
                              size: 18,
                            ),
                          ),
                          CNPopupMenuItem(
                            label: 'Delete',
                            icon: CNSymbol('trash', size: 18),
                          ),
                        ],
                        onSelected: (index) {
                          final actions = [
                            'New File',
                            'Open',
                            null,
                            'Rename',
                            'Delete'
                          ];
                          if (actions[index] != null) {
                            setState(() {
                              _lastAction = '${actions[index]} selected';
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // �����գ���ï
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CNIcon(symbol: CNSymbol('info.circle.fill')),
                          SizedBox(width: 8),
                          Text(
                            'Last Action',
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 4. SF Symbolsn��
/// iOS 26n����h��������
class _SFSymbolsDemo extends StatelessWidget {
  const _SFSymbolsDemo();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _iOS26Background(),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // Multicolor Symbols
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Multicolor Symbols',
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
                          _SymbolCard(
                            symbol: CNSymbol('paintpalette.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: 'Palette',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('heart.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: 'Heart',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('star.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: 'Star',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('cloud.sun.fill'),
                            mode: CNSymbolRenderingMode.multicolor,
                            label: 'Weather',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Hierarchical Symbols
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hierarchical Symbols',
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
                          _SymbolCard(
                            symbol: CNSymbol('battery.100'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: 'Battery',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('wifi'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: 'WiFi',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('speaker.wave.3.fill'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: 'Volume',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('bell.fill'),
                            mode: CNSymbolRenderingMode.hierarchical,
                            label: 'Alerts',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Monochrome Symbols
                _LiquidGlassContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Monochrome Symbols',
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
                          _SymbolCard(
                            symbol: CNSymbol('house.fill'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: 'Home',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('person.crop.circle'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: 'Profile',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('gearshape.fill'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: 'Settings',
                          ),
                          _SymbolCard(
                            symbol: CNSymbol('magnifyingglass'),
                            mode: CNSymbolRenderingMode.monochrome,
                            label: 'Search',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ===== ��ƣ�ƣ������ =====

/// iOS 26����n�o
class _iOS26Background extends StatelessWidget {
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

/// Liquid Glass����
/// BackdropFilterhͤƣֳ�����ȒD�[
class _LiquidGlassContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;

  const _LiquidGlassContainer({
    required this.child,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.25),
                Colors.white.withOpacity(0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

/// q���
class _StatCard extends StatelessWidget {
  final CNSymbol icon;
  final String title;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.25),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CNIcon(symbol: icon),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// _�L
class _FeatureRow extends StatelessWidget {
  final CNSymbol icon;
  final String text;

  const _FeatureRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          CNIcon(
            symbol: icon,
            mode: CNSymbolRenderingMode.multicolor,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ������
class _SymbolCard extends StatelessWidget {
  final CNSymbol symbol;
  final CNSymbolRenderingMode mode;
  final String label;

  const _SymbolCard({
    required this.symbol,
    required this.mode,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Center(
            child: CNIcon(
              symbol: symbol,
              mode: mode,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
