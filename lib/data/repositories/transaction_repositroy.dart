import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';

abstract interface class TransactionRepository {
  Future<Result<TransactionModel>> createTransaction({
    required TransactionModel transaction,
  });

  Future<Result<List<TransactionModel>>> getUserTransactions(
      {required String uid});

  
}


