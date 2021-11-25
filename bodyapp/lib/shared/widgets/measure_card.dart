import 'package:flutter/material.dart';

import '../colors.dart';

enum CardType { teal, white }

class MeasureCard extends StatelessWidget {
  final String label;
  final String value;
  final String measure;
  final CardType type;

  const MeasureCard({
    Key? key,
    required this.label,
    required this.value,
    required this.measure,
    this.type = CardType.teal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 127,
      decoration: BoxDecoration(
          color: type == CardType.teal ? AppColors.teal : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label',
            style: TextStyle(
              color: type == CardType.teal ? Colors.white : Colors.black,
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  text: '$value',
                  style: TextStyle(
                    color: type == CardType.teal ? Colors.white : Colors.black,
                    fontSize: 36,
                  ),
                  children: [
                    TextSpan(
                      text: ' $measure',
                      style: TextStyle(
                        color:
                            type == CardType.teal ? Colors.white : Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
