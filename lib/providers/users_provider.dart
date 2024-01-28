import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_state/model/user_model.dart';
part 'users_provider.g.dart';

final dio = Dio();

@riverpod
Future<List<UserModel>> fetchUsers(FetchUsersRef ref) async {
  var response = await dio.get("https://api.github.com/users");
  List<UserModel> users = [
    for (var item in response.data) UserModel.fromJson(item)
  ];

  return users;
}
