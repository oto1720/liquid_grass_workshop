import 'package:flutter/material.dart';
import 'package:cupertino_native/cupertino_native.dart';

/// シンボルカード
class SymbolCard extends StatelessWidget {
  final CNSymbol symbol;
  final CNSymbolRenderingMode mode;
  final String label;

  const SymbolCard({
    super.key,
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
