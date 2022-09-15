import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_example/src/hive_models/user.dart';
import 'package:hive_example/src/pages/add_user_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddUserPage());
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: Hive.box<User>('users').listenable(),
              builder: (BuildContext context, userBox, Widget? _) {
                return userBox.isEmpty
                    ? Column(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Center(child: Text('Empty data'))
                        ],
                      )
                    : Builder(
                        builder: (_) {
                          final items = userBox.values.toList();

                          return ListView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = items[index];

                              return ListTile(
                                leading: Icon(Icons.person),
                                title: Text('${item.name}'),
                                subtitle: Text('${item.email}'),
                              );
                            },
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
