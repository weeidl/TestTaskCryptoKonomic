import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_crypto_konomic/models/token.dart';
import 'package:test_task_crypto_konomic/screen/home/cubit/token_selection_main_cubit.dart';
import 'package:test_task_crypto_konomic/screen/home/widget/unselected_token_widget.dart';
import 'package:test_task_crypto_konomic/widgets/data_background_widget.dart';

class ChoiceTokenWidgets extends StatelessWidget {
  final TokenSelectionMainState tokenSelectionMainState;

  const ChoiceTokenWidgets({
    Key? key,
    required this.tokenSelectionMainState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Token? tokenA = tokenSelectionMainState.selectedTokenA;
    final Token? tokenB = tokenSelectionMainState.selectedTokenB;
    return DataBackgroundWidget(
      child: Column(
        children: [
          UnselectedTokenWidget(
            image: tokenA?.logo,
            nameToken: tokenA?.name ?? 'Token A',
          ),
          SvgPicture.asset('assets/arrow.svg'),
          UnselectedTokenWidget(
            image: tokenB?.logo,
            nameToken: tokenB?.name ?? 'Token B',
            isTokenA: false,
          ),
        ],
      ),
    );
  }
}
