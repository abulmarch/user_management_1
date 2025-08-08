import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/model/user_model/user_model.dart';
import 'package:user_app/providers/user_repository_provider.dart';

final userListProvider = FutureProvider.autoDispose<List<UserModel>>((ref)async {
  final repo = ref.watch(userRepositoryProvider);
  return repo.fetchUserList();
  }
);