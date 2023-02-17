import 'package:flutter/material.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';

class ButtonWidgets extends StatelessWidget {
  final GestureTapCallback onTap;
  final String name;
  const ButtonWidgets({
    Key? key,
    required this.onTap,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
      child: InkWell(
        onTap: onTap,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: CryptoColor.gradient,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            width: double.infinity,
            child: Center(
              child: Text(
                name,
                style: CryptoTextStyle.button(
                  CryptoColor.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
