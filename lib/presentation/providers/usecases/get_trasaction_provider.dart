import 'package:flutter_nusa_movie/domain/usecase/get_transaction/get_transaction.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/transcation_repository/transcation_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_trasaction_provider.g.dart';

@riverpod
GetTranscation getTransaction(GetTransactionRef ref) {
  return GetTranscation(
      transactionRepository: ref.watch(transactionRepositoryProvider));
}
