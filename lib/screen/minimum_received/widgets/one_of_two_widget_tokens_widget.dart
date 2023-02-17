import 'package:flutter/material.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';

class OneOfTwoWidgetTokensWidget extends StatelessWidget {
  final String name;
  final String logo;
  const OneOfTwoWidgetTokensWidget({
    Key? key,
    required this.name,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          color: CryptoColor.darkBlue,
          height: 58,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.network(logo),
                const SizedBox(width: 16),
                Text(name, style: CryptoTextStyle.body(CryptoColor.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
