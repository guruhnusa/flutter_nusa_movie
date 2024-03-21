import 'package:flutter_nusa_movie/data/repositories/transaction_repositroy.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/create_transaction/create_transaction.dart';
import 'package:flutter_nusa_movie/domain/usecase/create_transaction/create_transaction_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/top_up/top_up_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class TopUp implements UseCase<Result<void>, TopUpParam> {
  final TransactionRepository _transactionRepository;

  TopUp({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<void>> call(TopUpParam params) async {
    CreateTransaction createTransaction =
        CreateTransaction(transactionRepository: _transactionRepository);
    final int transactionTime = DateTime.now().millisecondsSinceEpoch;
    final result = await createTransaction.call(
      CreateTransactionParam(
        transaction: TransactionModel(
            title: 'Top Up',
            id: "NIDTP-$transactionTime-${params.userId}",
            uid: params.userId,
            transactionTime: transactionTime,
            adminFee: 0,
            total: -params.amount),
      ),
    );
    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(message: _) => const Result.failed('Failed to top up balance'),
    };
  }
}
