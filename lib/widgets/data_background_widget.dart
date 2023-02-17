import 'package:flutter/material.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';

class DataBackgroundWidget extends StatelessWidget {
  final Widget child;
  const DataBackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: const BoxDecoration(
            color: CryptoColor.background,
            image: DecorationImage(
              image: AssetImage("assets/texture.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
