import 'package:flutter_nusa_movie/data/repositories/transaction_repositroy.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';
import 'package:flutter_nusa_movie/domain/usecase/get_transaction/get_transacton_param.dart';
import 'package:flutter_nusa_movie/domain/usecase/usecase.dart';

class GetTranscation
    implements UseCase<Result<List<TransactionModel>>, GetTransactionParam> {
  final TransactionRepository _transactionRepository;

  GetTranscation({required TransactionRepository transactionRepository})
      : _transactionRepository = transactionRepository;

  @override
  Future<Result<List<TransactionModel>>> call(
      GetTransactionParam params) async {
    final result =
        await _transactionRepository.getUserTransactions(uid: params.uId);
    return switch (result) {
      Success(value: final transactions) => Result.success(transactions),
      Failed(:final message) => Result.failed(message),
    };
  }
}
