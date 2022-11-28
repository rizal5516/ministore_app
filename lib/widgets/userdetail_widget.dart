import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:ministore_app/consts/global_colors.dart';
import 'package:ministore_app/screens/users_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../models/users_model.dart';
import '../screens/users_detail.dart';

class UsersDetailWidget extends StatelessWidget {
  const UsersDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final usersModelProvider = Provider.of<UsersModel>(context);
    return ListTile(
      // leading: FancyShimmerImage(
      //   height: size.width * 0.15,
      //   width: size.width * 0.15,
      //   errorWidget: const Icon(
      //     IconlyBold.danger,
      //     color: Colors.red,
      //     size: 28,
      //   ),
      //   imageUrl: usersModelProvider.avatar.toString(),
      //   boxFit: BoxFit.fill,
      // ),
      title: Text(usersModelProvider.email.toString()),
      subtitle: Text(usersModelProvider.password.toString()),
      trailing: Text(
        usersModelProvider.role.toString(),
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
