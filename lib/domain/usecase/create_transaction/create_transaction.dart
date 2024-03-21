import 'package:flutter_nusa_movie/data/repositories/transaction_repositroy.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/usecase/create_transaction/create_transaction_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class CreateTransaction
    implements UseCase<Result<void>, CreateTransactionParam> {
  final TransactionRepository _transactionRepository;

  CreateTransaction({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;
  @override
  Future<Result<void>> call(CreateTransactionParam params) async {
    int transactionTime = DateTime.now().millisecondsSinceEpoch;

    final result = await _transactionRepository.createTransaction(
      transaction: params.transaction.copyWith(
        id: (params.transaction.id == null)
            ? "NID-$transactionTime-${params.transaction.uid}"
            : params.transaction.id,
        transactionTime: transactionTime,
      ),
    );
    return switch (result) {
      Success(value: _) => const Result.success(null),
      Failed(:final message) => Result.failed(message),
    };
  }
}
