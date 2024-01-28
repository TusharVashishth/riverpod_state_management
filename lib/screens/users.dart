import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state/providers/users_provider.dart';
import 'package:riverpod_state/screens/todo.dart';

class Users extends ConsumerWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(fetchUsersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4),
        child: switch (users) {
          AsyncData(:final value) => ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: value.length,
              itemBuilder: (context, index) => ListTile(
                leading: value[index].avatar_url != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(value[index].avatar_url!),
                      )
                    : const Icon(Icons.person),
                title: Text(value[index].login),
              ),
            ),
          AsyncError(:final error) => showSnackBar(context),
          _ => const Center(
              child: CircularProgressIndicator(),
            )
        },
      ),
    );
  }
}
