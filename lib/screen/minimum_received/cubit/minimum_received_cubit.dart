import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:test_task_crypto_konomic/constation.dart';
import 'package:test_task_crypto_konomic/models/token.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

part 'minimum_received_state.dart';

class ShowAmountCubit extends Cubit<ShowAmountState> {
  ShowAmountCubit() : super(ShowAmountInitial());

  final Web3Client web3Client = Web3Client(urlRpc, Client());

  Future<void> fetch({
    required Token tokenA,
    required Token tokenB,
  }) async {
    emit(ShowAmountLoading());

    final String amount = await giveAmount(tokenA: tokenA, tokenB: tokenB);

    emit(ShowAmountLoaded(
      selectedTokenA: tokenA,
      selectedTokenB: tokenB,
      amount: amount,
      dateTime: time(),
    ));
  }

  Future<String> giveAmount(
      {required Token tokenA, required Token tokenB}) async {
    final String tokenAddressA = tokenA.address.toLowerCase();
    final String tokenAddressB = tokenB.address.toLowerCase();

    final pairAddress = tokenAddressA.compareTo(tokenAddressB) > 0
        ? getAddressAndHash(tokenB.address, tokenA.address)
        : getAddressAndHash(tokenA.address, tokenB.address);

    final pairContract = await getAddress(pairAddress);

    final response = await getTokens(pairContract);

    final String amount = (response[0] / response[1]).toStringAsFixed(12);

    return amount;
  }

  void refresh() async {
    final stateLoaded = state as ShowAmountLoaded;

    final String amount = await giveAmount(
        tokenA: stateLoaded.selectedTokenA, tokenB: stateLoaded.selectedTokenB);
    emit(stateLoaded.copyWith(amount: amount, dateTime: time()));
  }

  String time() {
    DateTime now = DateTime.now();
    return DateFormat('E, d MMM yyyy \n HH:mm:ss').format(now);
  }

  String getAddressAndHash(String tokenAddressA, String tokenAddressB) =>
      getCreateAddress(
        factoryAddress,
        tokenAddressA,
        tokenAddressB,
        initCodeHash,
      );

  String getCreateAddress(String from, String token0Address,
          String token1Address, String initCodeHash) =>
      getCreate(
          from,
          keccak256(Uint8List.fromList(
              hexToBytes(token0Address) + hexToBytes(token1Address))),
          initCodeHash);

  String getCreate(String from, Uint8List salt, String initCodeHash) =>
      '0x${bytesToHex(
        keccak256(
          Uint8List.fromList(
            hexToBytes(prefix) +
                hexToBytes(from) +
                salt +
                hexToBytes(initCodeHash),
          ),
        ),
      ).substring(24)}';

  Future<DeployedContract> getAddress(String address) async {
    final ContractAbi pairAbiCode = ContractAbi.fromJson(
        await rootBundle.loadString('assets/abi/abi.json'), 'pair');
    return DeployedContract(pairAbiCode, EthereumAddress.fromHex(address));
  }

  Future<List<dynamic>> getTokens(DeployedContract contract) => web3Client.call(
        contract: contract,
        function: contract.function('getReserves'),
        params: [],
      );

  @override
  Future<void> close() {
    web3Client.dispose();
    return super.close();
  }
}
