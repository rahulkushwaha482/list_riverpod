import 'package:flutter/material.dart';
import '../model/user_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.e}) : super(key: key);
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Hero(
              tag: '${e.id}',
              child: Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(e.avatar),
                ),
              ),
            ),
            Text(
              e.firstname + " " + e.lastname,
            ),
            Text(e.email),
          ],
        ),
      ),
    );
  }
}
