import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nusa_movie/presentation/misc/methods.dart';
import 'package:flutter_nusa_movie/presentation/widgets/selectable_card.dart';

List<Widget> optionSelect<T>({
  required String title,
  required List<T> options,
  required T? selectedOption,
  String Function(T object)? converter,
  bool Function(T object)? isOptionEnable,
  required void Function(T object) onTap,
}) {
  return [
    Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    verticalSpace(10),
    SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: options.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: options[index] == options.first ? 24 : 0,
              right: options[index] == options.last ? 24 : 10,
            ),
            child: SelectableCard(
              text: converter != null
                  ? converter(options[index])
                  : options[index].toString(),
              isSelected: options[index] == selectedOption,
              isEnable: isOptionEnable?.call(options[index]) ?? true,
              onTap: () => onTap(options[index]),
            ),
          );
        },
      ),
    )
  ];
}
