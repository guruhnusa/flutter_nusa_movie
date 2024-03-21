import 'package:flutter_nusa_movie/domain/usecase/create_transaction/create_transaction.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/transcation_repository/transcation_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_transaction_provider.g.dart';

@riverpod
CreateTransaction createTransaction(CreateTransactionRef ref) {
  return CreateTransaction(
      transactionRepository: ref.watch(transactionRepositoryProvider));
}
