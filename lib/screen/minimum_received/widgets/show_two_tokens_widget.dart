import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_crypto_konomic/screen/minimum_received/cubit/minimum_received_cubit.dart';
import 'package:test_task_crypto_konomic/screen/minimum_received/widgets/one_of_two_widget_tokens_widget.dart';
import 'package:test_task_crypto_konomic/widgets/data_background_widget.dart';

class ShowTwoTokensWidget extends StatelessWidget {
  final ShowAmountLoaded stateToken;
  const ShowTwoTokensWidget({
    Key? key,
    required this.stateToken,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tokenA = stateToken.selectedTokenA;
    final tokenB = stateToken.selectedTokenB;
    return DataBackgroundWidget(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OneOfTwoWidgetTokensWidget(name: tokenA.name, logo: tokenA.logo),
          const SizedBox(width: 24),
          RotationTransition(
              turns: const AlwaysStoppedAnimation(-90 / 360),
              child: SvgPicture.asset('assets/arrow.svg')),
          const SizedBox(width: 24),
          OneOfTwoWidgetTokensWidget(name: tokenB.name, logo: tokenB.logo),
        ],
      ),
    );
  }
}
