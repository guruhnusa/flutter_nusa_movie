import 'package:flutter/foundation.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';
import 'package:flutter_nusa_movie/domain/entities/user_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_transaction/get_transaction.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_transaction/get_transacton_param.dart';
import 'package:flutter_nusa_movie/presentation/providers/usecases/get_trasaction_provider.dart';
import 'package:flutter_nusa_movie/presentation/providers/user_data/user_data_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'transaction_data_provider.g.dart';

@Riverpod(keepAlive: true)
class TransactionData extends _$TransactionData {
  @override
  Future<List<TransactionModel>> build() async {
    UserModel? user = ref.read(userDataProvider).valueOrNull;
    if (user != null) {
      state = const AsyncLoading();
      GetTranscation getTranscation = ref.read(getTransactionProvider);
      final result =
          await getTranscation.call(GetTransactionParam(uId: user.uid));
      if (result case Success(value: final transaction)) {
        return transaction;
      }
    }
    return [];
  }

  Future<void> refreshTransaction() async {
    UserModel? user = ref.read(userDataProvider).valueOrNull;
    if (user != null) {
      state = const AsyncLoading();
      GetTranscation getTranscation = ref.read(getTransactionProvider);
      final result =
          await getTranscation.call(GetTransactionParam(uId: user.uid));
      switch (result) {
        case Success(value: final transaction):
          state = AsyncData(transaction);
        case Failed(message: final error):
          state = AsyncError(FlutterError(error), StackTrace.current);
          state = AsyncData(state.valueOrNull ?? const []);
      }
    }
  }
}
