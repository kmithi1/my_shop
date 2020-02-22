import 'package:flutter/material.dart';

class NumberStepper extends StatelessWidget {
  final int currentValue;
  final int minValue;
  final int maxValue;
  final Function onChange;

  NumberStepper({
    this.currentValue = 0,
    this.minValue = 0,
    this.maxValue = 100,
    this.onChange,
  });

  void _didPressRemove() {
    if (currentValue - 1 >= minValue) {
      onChange(currentValue - 1);
    }
  }

  void _didPressAdd() {
    if (currentValue + 1 <= maxValue) {
      onChange(currentValue + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.remove,
            ),
            onPressed: currentValue > minValue ? _didPressRemove : null,
          ),
          Expanded(
            child: Text(
              currentValue.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.add,
            ),
            onPressed: currentValue < maxValue ? _didPressAdd : null,
          )
        ],
      ),
    );
  }
}
