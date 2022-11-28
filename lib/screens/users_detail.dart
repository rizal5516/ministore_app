import 'package:flutter/material.dart';
import 'package:ministore_app/widgets/users_widget.dart';
import 'package:provider/provider.dart';
import 'package:ministore_app/models/categories_model.dart';
import 'package:ministore_app/widgets/category_widget.dart';

import '../models/users_model.dart';
import '../services/api_handler.dart';
import '../widgets/userdetail_widget.dart';

class UsersDetail extends StatelessWidget {
  const UsersDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Users")),
      body: FutureBuilder<List<UsersModel>>(
        future: APIHandler.getAllUsers(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            Center(
              child: Text("An error occured ${snapshot.error}"),
            );
          } else if (snapshot.data == null) {
            const Center(
              child: Text("No products has been added yet"),
            );
          }
          return ListView.builder(
              // itemCount: snapshot.data!.length,
              itemCount: 1,
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                    value: snapshot.data![index],
                    child: const UsersDetailWidget());
              });
        }),
      ),
    );
  }
}
