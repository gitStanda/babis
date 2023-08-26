import 'package:flutter/material.dart';

// nepouzivany
class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          // padding: const EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(12)),
          child: const Center(
            child: Text(
              'Babišovo?',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
