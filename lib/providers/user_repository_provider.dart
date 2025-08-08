import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/providers/dio_provider.dart';
import 'package:user_app/repositories/user_repository.dart';
import 'package:user_app/repositories/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(dioProvider),
);
