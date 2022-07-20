import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class UsersWidget extends StatelessWidget {
  const UsersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final usersModelProvider = Provider.of<UsersModel>(context);
    return ListTile(
      leading: FancyShimmerImage(
        height: size.width * 0.15,
        width: size.width * 0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: usersModelProvider.avatar.toString(),
        boxFit: BoxFit.fill,
      ),
      title: Text(usersModelProvider.name.toString()),
      subtitle:  Text(usersModelProvider.email.toString()),
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
