import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// common shimmer effect widget for display while loading data
class AppShimmer extends StatelessWidget {
  final Widget child;

  //shimmer color
  static Color shimmerBaseColor = Colors.grey.shade500;
  static Color shimmerHighlightColor = Colors.grey.shade100;

  const AppShimmer({super.key,  required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: shimmerBaseColor,
      highlightColor: shimmerHighlightColor,
      enabled: true,
      child: child,
    );
  }
}
