import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_crypto_konomic/screen/home/cubit/token_selection_main_cubit.dart';
import 'package:test_task_crypto_konomic/screen/home/widget/choice_token_widgets.dart';
import 'package:test_task_crypto_konomic/screen/minimum_received/minimum_received_screen.dart';
import 'package:test_task_crypto_konomic/theme/colors.dart';
import 'package:test_task_crypto_konomic/theme/text_style.dart';
import 'package:test_task_crypto_konomic/widgets/background_widget.dart';
import 'package:test_task_crypto_konomic/widgets/select_button_widget.dart';

class TokenSelectionMainScreen extends StatelessWidget {
  const TokenSelectionMainScreen({Key? key}) : super(key: key);

  void messageDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: CryptoColor.purple2,
          content: Text('Please select a token',
              textAlign: TextAlign.center,
              style: CryptoTextStyle.button(
                CryptoColor.white,
              )),
          actions: [
            Center(
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Text(
                  'Back',
                  style: CryptoTextStyle.button(
                    CryptoColor.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TokenSelectionMainCubit, TokenSelectionMainState>(
        builder: (context, state) {
          return BackgroundWidget(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 64),
                  Text(
                    'Exchange',
                    style: CryptoTextStyle.title1(CryptoColor.white),
                  ),
                  const SizedBox(height: 34),
                  ChoiceTokenWidgets(
                    tokenSelectionMainState: state,
                  ),
                  const Spacer(),
                  ButtonWidgets(
                    onTap: () {
                      if (state.selectedTokenA != null &&
                          state.selectedTokenB != null) {
                        Navigator.push(
                          context,
                          MinimumReceivedScreen.route(
                            tokenA: state.selectedTokenA!,
                            tokenB: state.selectedTokenB!,
                          ),
                        );
                      } else {
                        messageDialog(context);
                      }
                    },
                    name: 'Convert',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
