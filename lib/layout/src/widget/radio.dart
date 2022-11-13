import 'package:flutter/material.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T> onChanged;
  final VisualDensity? visualDensity;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.visualDensity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () => onChanged(value),
      splashRadius: 20,
      highlightColor: theme.colorScheme.primary.withOpacity(0.2),
      splashColor: Colors.transparent,
      visualDensity: visualDensity ?? Theme.of(context).visualDensity,
      icon: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: value == groupValue ? 6 : 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const SizedBox.square(dimension: 20),
      ),
    );
  }
}
