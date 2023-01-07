import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      this.label, this.id, this.asset, this.color, this.textColor,
      {super.key});

  final String label;
  final String asset;
  final int id;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            asset,
            width: 150,
            height: 150,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 30, color: textColor)),
              Text('Tasks: 0',
                  style: TextStyle(fontSize: 20, color: textColor)),
            ],
          ),
        ],
      ),
    );
  }
}
