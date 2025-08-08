import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/providers/user_list_provider.dart';
import 'package:user_app/widgets/error_widget.dart';
import 'package:user_app/widgets/loading_widget.dart';
import 'package:user_app/widgets/user_card.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: userAsync.when(
          data: (users) => RefreshIndicator(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return UserCard(
                    user: users[index],
                    ontap: () {
                      
                    },
                  );
                },
                itemCount: users.length,
              ),
              onRefresh: () => ref.refresh(userListProvider.future)),
          error: (er, stack) => const CustomErrorWidget(),
          loading: () => const LoadingWidget()),
    );
  }
}
