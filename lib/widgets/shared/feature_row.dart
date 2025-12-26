import 'package:flutter/material.dart';
import 'package:cupertino_native/cupertino_native.dart';

/// 機能行
class FeatureRow extends StatelessWidget {
  final CNSymbol icon;
  final String text;

  const FeatureRow({
    super.key,
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
