import 'package:flutter/material.dart';

class ItemDeprecation extends StatelessWidget {
  final String message;

  const ItemDeprecation({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.5),
          color: Colors.amber.withOpacity(.15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Text(
            'Deprecated: $message',
            style: TextStyle(
              color: Colors.yellow.shade900.withOpacity(.9),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
