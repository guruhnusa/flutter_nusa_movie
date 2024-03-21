import 'package:flutter_nusa_movie/domain/usecase/top_up/top_up.dart';
import 'package:flutter_nusa_movie/presentation/providers/repositories/transcation_repository/transcation_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'top_up_provider.g.dart';

@riverpod
TopUp topUp(TopUpRef ref) {
  return TopUp(transactionRepository: ref.watch(transactionRepositoryProvider));
}
