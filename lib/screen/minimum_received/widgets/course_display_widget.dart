import 'package:flutter/material.dart';
import 'package:test_task_crypto_konomic/screen/minimum_received/cubit/minimum_received_cubit.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';
import 'package:test_task_crypto_konomic/widgets/data_background_widget.dart';

class CourseDisplayWidget extends StatelessWidget {
  final ShowAmountLoaded showAmountState;
  const CourseDisplayWidget({
    Key? key,
    required this.showAmountState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataBackgroundWidget(
      child: Column(
        children: [
          Text(
            'Minimum received',
            style: CryptoTextStyle.title2(CryptoColor.white),
          ),
          const SizedBox(height: 24),
          Text(
            showAmountState.amount,
            style: CryptoTextStyle.amount(CryptoColor.purple),
          ),
          const SizedBox(height: 24),
          Text(
            showAmountState.dateTime,
            textAlign: TextAlign.center,
            style: CryptoTextStyle.body(CryptoColor.white),
          ),
        ],
      ),
    );
  }
}
