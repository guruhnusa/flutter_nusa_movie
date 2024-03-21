import 'package:flutter/material.dart';
import 'package:flutter_nusa_movie/presentation/misc/constant.dart';

class SelectableCard extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isEnable;

  final VoidCallback? onTap;
  const SelectableCard({
    super.key,
    required this.text,
    this.isSelected = false,
    this.isEnable = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnable ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? saffron.withOpacity(0.3) : null,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isEnable ? saffron : Colors.grey,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? ghostWhite : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
