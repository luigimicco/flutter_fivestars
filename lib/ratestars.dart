import 'package:flutter/material.dart';

class RateStars extends StatefulWidget {
  final int stars;
  final Function(int value) onPressed;
  final double? size;
  final int maxStars;
  const RateStars(
      {required this.onPressed,
      this.stars = 0,
      this.size,
      this.maxStars = 5,
      super.key});

  @override
  State<RateStars> createState() => _RateStarsState();
}

class _RateStarsState extends State<RateStars> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars, (index) {
        return InkWell(
          customBorder: const CircleBorder(),
          child: _getStar(index),
          onTap: () => widget.onPressed(index),
        );
      }),
    );
  }

  Icon _getStar(int pos) {
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
