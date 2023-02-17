import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_crypto_konomic/models/token.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';

class TokenListWidget extends StatelessWidget {
  final Token token;

  const TokenListWidget({
    Key? key,
    required this.token,
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
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Image.network(token.logo),
                const SizedBox(width: 16),
                Text(
                  token.name,
                  style: CryptoTextStyle.body(CryptoColor.white),
                ),
                const Spacer(),
                RotationTransition(
                    turns: const AlwaysStoppedAnimation(-90 / 360),
                    child: SvgPicture.asset('assets/arrow.svg')),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
