import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_crypto_konomic/models/token.dart';
import 'package:test_task_crypto_konomic/screen/minimum_received/cubit/minimum_received_cubit.dart';
import 'package:test_task_crypto_konomic/screen/minimum_received/widgets/course_display_widget.dart';
import 'package:test_task_crypto_konomic/screen/minimum_received/widgets/show_two_tokens_widget.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';
import 'package:test_task_crypto_konomic/widgets/background_widget.dart';
import 'package:test_task_crypto_konomic/widgets/select_button_widget.dart';

class MinimumReceivedScreen extends StatelessWidget {
  final Token tokenA;
  final Token tokenB;
  const MinimumReceivedScreen({
    Key? key,
    required this.tokenA,
    required this.tokenB,
  }) : super(key: key);

  static Route route({
    required Token tokenA,
    required Token tokenB,
  }) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => ShowAmountCubit(),
        child: MinimumReceivedScreen(
          tokenA: tokenA,
          tokenB: tokenB,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWidget(
        child: BlocBuilder<ShowAmountCubit, ShowAmountState>(
          builder: (context, state) {
            if (state is ShowAmountInitial) {
              context
                  .read<ShowAmountCubit>()
                  .fetch(tokenA: tokenA, tokenB: tokenB);
            }
            if (state is ShowAmountLoaded) {
              // Timer.periodic(const Duration(minutes: 1), (_) async {
              //   print('----');
              //   context.read<ShowAmountCubit>().refresh();
              // });

              return Center(
                child: Column(
                  children: [
                    const SizedBox(height: 64),
                    Text(
                      'Exchange',
                      style: CryptoTextStyle.title1(CryptoColor.white),
                    ),
                    const SizedBox(height: 64),
                    CourseDisplayWidget(
                      showAmountState: state,
                    ),
                    const SizedBox(height: 8),
                    ShowTwoTokensWidget(stateToken: state),
                    const Spacer(),
                    ButtonWidgets(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      name: 'Back',
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
