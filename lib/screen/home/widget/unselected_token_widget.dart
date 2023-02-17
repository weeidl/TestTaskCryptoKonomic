import 'package:flutter/material.dart';
import 'package:test_task_crypto_konomic/screen/token_list/token_list.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';

class UnselectedTokenWidget extends StatelessWidget {
  final String? image;
  final String nameToken;
  final bool isTokenA;

  const UnselectedTokenWidget({
    Key? key,
    required this.image,
    required this.nameToken,
    this.isTokenA = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
      child: InkWell(
        onTap: () {
          TokenList.show(buildContext: context, isTokenA: isTokenA);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Container(
            color: CryptoColor.darkBlue,
            height: 58,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image == null
                      ? Image.asset(
                          'assets/unselected_token.png',
                          width: 42,
                        )
                      : Image.network(image!),
                  const Spacer(),
                  Text(
                    nameToken,
                    style: CryptoTextStyle.body(CryptoColor.white),
                  ),
                  const Spacer(),
                  const SizedBox(width: 42),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
