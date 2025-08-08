import 'package:dio/dio.dart';
import 'package:user_app/model/user_model/user_model.dart';
import 'package:user_app/repositories/user_repository.dart';
import 'package:user_app/utils/constants.dart';

class UserRepositoryImpl extends UserRepository {
  final Dio dio;
  UserRepositoryImpl(this.dio);
  @override
  Future<UserModel> addUser(UserModel user) async {
         try {
      final response = await dio.post(baseUrl, data: user.toJson());
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
    } else {
      throw Exception('failed to connect');
    }
    } catch (e) {
      throw Exception('Unexcpeted error');
    }
  }

  @override
  Future<UserModel> fetchUserDetails(int id) async{
     try {
      final response = await dio.get('$baseUrl/$id');
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
    } else {
      throw Exception('failed to connect');
    }
    } catch (e) {
      throw Exception('Unexcpeted error');
    }
  }

  @override
  Future<List<UserModel>> fetchUserList() async {
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        return (response.data as List).map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('failed to connect');
    }
    } catch (e) {
      throw Exception('Unexcpeted error');
    }
    
  }

  @override
  Future<UserModel> updateUser(UserModel user, ) async{
    try {
      final response = await dio.put('$baseUrl/${user.id}', data: user.toJson());
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
    } else {
      throw Exception('failed to connect');
    }
    } catch (e) {
      throw Exception('Unexcpeted error');
    }
  }
  
  @override
  Future<bool> deleteUser(int id) async{
    try {
      final response = await dio.delete('$baseUrl/$id');
      if (response.statusCode == 200) {
        return true;
    } else {
      throw Exception('failed to connect');
    }
    } catch (e) {
      throw Exception('Unexcpeted error');
    }
  }
}
