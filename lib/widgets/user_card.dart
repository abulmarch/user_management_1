import 'package:flutter/material.dart';
import 'package:user_app/model/user_model/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user, this.ontap});
final UserModel user;
final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name ?? '-'),
      subtitle: Text(user.email ?? '-'),
      onTap: ontap,
    );
  }
}