import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gsg_api/api_provider.dart';
import 'package:gsg_api/models/user.dart';
import 'package:gsg_api/server.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Selector<ApiProvider, User>(
      builder: (context, value, child) {
        return WillPopScope(
          onWillPop: () {
            // Provider.of<ApiProvider>(Get.context, listen: false)
            //     .clearSelectedUser();
            return Future.value(false);
          },
          child: Scaffold(
              appBar: AppBar(
                title: Text(value != null ? value.firstName : ''),
              ),
              body: value == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(value.avatar))),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${value.firstName} ${value.lastName}'),
                              Text(value.email),
                              RaisedButton(onPressed: () {
                                registerUser('wesam@gmail.com', 'developer');
                              })
                            ],
                          ),
                        ],
                      ),
                    )),
        );
      },
      selector: (x, y) {
        return y.selectedUser;
      },
    );
  }
}
