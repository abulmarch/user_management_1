import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/model/user_model/user_model.dart';
import 'package:user_app/providers/user_repository_provider.dart';

final userDetailProvider =
    FutureProvider.autoDispose.family<UserModel, int>((ref, id) async {
  final repo = ref.watch(userRepositoryProvider);
  return repo.fetchUserDetails(id);
});
