import 'package:flutter_nusa_movie/data/Firebase/firebase_transaction_repository.dart';
import 'package:flutter_nusa_movie/data/repositories/transaction_repositroy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'transcation_repository_provider.g.dart';

@riverpod
TransactionRepository transactionRepository(TransactionRepositoryRef ref) {
  return FirebaseTransactionRepostiroy();
}
