import 'package:user_app/model/user_model/user_model.dart';

abstract class UserRepository{
  Future<List<UserModel>> fetchUserList();  
  Future<UserModel> fetchUserDetails(int id);
  Future<UserModel> addUser(UserModel user);
  Future<UserModel> updateUser(UserModel user, );
  Future<bool> deleteUser(int id);
}