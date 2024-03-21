import 'package:flutter_nusa_movie/data/Firebase/firebase_user_repository.dart';
import 'package:flutter_nusa_movie/data/repositories/transaction_repositroy.dart';
import 'package:flutter_nusa_movie/domain/entities/result.dart';
import 'package:flutter_nusa_movie/domain/entities/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;

class FirebaseTransactionRepostiroy implements TransactionRepository {
  final firestore.FirebaseFirestore _firebaseFirestore;

  FirebaseTransactionRepostiroy(
      {firestore.FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore =
            firebaseFirestore ?? firestore.FirebaseFirestore.instance;

  @override
  Future<Result<TransactionModel>> createTransaction(
      {required TransactionModel transaction}) async {
    firestore.CollectionReference<Map<String, dynamic>> collectionReference =
        _firebaseFirestore.collection('transactions');
    try {
      final balanceResult =
          await FirebaseUserRepository().getUserBalance(uid: transaction.uid);
      if (balanceResult.isSuccess) {
        int previousBalance = balanceResult.resultValue!;
        if (previousBalance - transaction.total >= 0) {
          await collectionReference
              .doc(transaction.id)
              .set(transaction.toJson());
          final result = await collectionReference.doc(transaction.id).get();
          if (result.exists) {
            int newBalance = previousBalance - transaction.total;
            await FirebaseUserRepository()
                .updateUserBalance(uid: transaction.uid, balance: newBalance);
            return Result.success(TransactionModel.fromJson(result.data()!));
          } else {
            return const Result.failed('Transaction not found');
          }
        } else {
          return const Result.failed('Balance not enough');
        }
      } else {
        return const Result.failed(
            'Failed to create transaction balance not found');
      }
    } catch (e) {
      return const Result.failed('Failed to create transaction');
    }
  }

  @override
  Future<Result<List<TransactionModel>>> getUserTransactions(
      {required String uid}) async {
    firestore.CollectionReference<Map<String, dynamic>> transactions =
        _firebaseFirestore.collection('transactions');
    try {
      final result = await transactions.where('uid', isEqualTo: uid).get();
      if (result.docs.isNotEmpty) {
        List<TransactionModel> transactionList = result.docs
            .map((e) => TransactionModel.fromJson(e.data()))
            .toList();
        return Result.success(transactionList);
      } else {
        return const Result.success([]);
      }
    } catch (e) {
      return const Result.failed('Failed to get user transactions');
    }
  }
}
