import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:list_riperpod/model/user_model.dart';
import '../provider/provider.dart';
import 'detail_page.dart';

class Homepage extends ConsumerWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
        ),
        body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Column(
              children: [
                ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (BuildContext ctx, int index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            e: userList[index],
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Hero(
                              tag: '${userList[index].id}',
                              child: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(userList[index].avatar),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(userList[index].firstname),
                                Text(userList[index].email),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                ),
              ],
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
