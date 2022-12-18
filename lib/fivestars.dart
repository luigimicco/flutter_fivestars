import 'package:flutter/material.dart';

class FiveStars extends StatefulWidget {
  final int stars;
  final Function(int value) onPressed;
  final double? size;
  const FiveStars(
      {required this.onPressed, this.stars = 0, this.size, super.key});

  @override
  State<FiveStars> createState() => _FiveStarsState();
}

class _FiveStarsState extends State<FiveStars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return InkWell(
          customBorder: const CircleBorder(),
          child: getStar(index),
          onTap: () => widget.onPressed(index),
        );
      }),
    );
  }

  Icon getStar(int pos) {
    IconData icon = Icons.star;
    Color color = Colors.orange;

    if (pos > widget.stars) {
      icon = Icons.star_border;
      color = Colors.grey;
    }
    return Icon(
      icon,
      color: color,
      size: widget.size,
    );
  }
}
