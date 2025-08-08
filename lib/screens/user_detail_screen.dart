import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_app/providers/user_detail_provider.dart';
import 'package:user_app/widgets/error_widget.dart';
import 'package:user_app/widgets/loading_widget.dart';

class UserDetailScreen extends ConsumerWidget {
  const UserDetailScreen(this.userid, {super.key});
final int userid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    final userAsync = ref.watch(userDetailProvider(userid));

    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
      body: userAsync.when(
        data: (user) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name: ${user.name}", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              Text("Email: ${user.email}"),
              const Spacer(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: (){},
                    child: const Text("Edit"),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                     
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: const Text("Delete"),
                  ),
                ],
              )
            ],
          ),
        ),
        loading: () => const LoadingWidget(),
        error: (err, _) => CustomErrorWidget(message: err.toString()),
      ),
    );
  }
}
