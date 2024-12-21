import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/user.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      // Jika server mengembalikan response 200 OK, maka parse JSON
      List<dynamic> data = json.decode(response.body);
      return data.map((userJson) => User.fromJson(userJson)).toList();
    } else {
      // Jika response gagal
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Ahmad Zailani',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          const Text(
            '2210010451',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: fetchUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error loading users.'));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  final users = snapshot.data!;
                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return ListTile(
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          user.username,
                          style: const TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        trailing: Text(
                          user.email,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No users found.'));
                }
                
              },
            ),
          ),
        ],
      ),
    );
  }
}
