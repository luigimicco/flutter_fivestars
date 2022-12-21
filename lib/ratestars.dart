import 'package:flutter/material.dart';

class RateStars extends StatelessWidget {
  final int stars;
  final Function(int value) onPressed;
  final double? size;
  final int maxRate;
  const RateStars(
      {required this.onPressed,
      this.stars = 0,
      this.size,
      this.maxRate = 5,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRate, (index) {
        return InkWell(
          customBorder: const CircleBorder(),
          child: _getIcon(index, size),
          onTap: () => onPressed(index),
        );
      }),
    );
  }

  Icon _getIcon(int value, double? sizeIcon) {
    IconData icon = Icons.star;
    Color color = Colors.orange;

    if (value > stars) {
      icon = Icons.star_border;
      color = Colors.grey;
    }
    return Icon(
      icon,
      color: color,
      size: sizeIcon,
    );
  }
}
