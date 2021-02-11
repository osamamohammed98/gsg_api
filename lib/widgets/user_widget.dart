import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gsg_api/models/user.dart';
import 'package:gsg_api/screens/user_details.dart';
import 'package:gsg_api/server.dart';

class UserWidget extends StatelessWidget {
  User user;
  UserWidget(this.user);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(user.avatar))),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${user.firstName} ${user.lastName}'),
              Text(user.email)
            ],
          ),
          Spacer(),
          IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: () {
                getOneUserFromApi(user.id);
                Get.to(UserDetails());
              })
        ],
      ),
    );
  }
}
