import 'package:flutter/material.dart';
import 'package:gsg_api/api_provider.dart';
import 'package:gsg_api/models/user.dart';
import 'package:gsg_api/widgets/user_widget.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Users Page'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          child: Selector<ApiProvider, List<User>>(
            selector: (x, y) {
              return y.users;
            },
            builder: (context, value, child) {
              if (value.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return UserWidget(value[index]);
                  },
                );
              }
            },
          ),
        ));
  }
}
