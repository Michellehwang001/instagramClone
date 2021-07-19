import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final user = FirebaseAuth.instance.currentUser;

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Instagram에 오신 것을 환영합니다.',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '사진과 동영상을 보려면 팔로우하세요.',
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 260,
                  child: Card(
                    elevation: 4.0,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage('${user?.photoURL}'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${user?.email}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('${user?.displayName}'),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://www.street.co.kr/wp-content/uploads/2020/07/00-23.jpg',
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Image.network(
                              'https://www.street.co.kr/wp-content/uploads/2020/07/00-23.jpg',
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              width: 1,
                            ),
                            Image.network(
                              'https://www.street.co.kr/wp-content/uploads/2020/07/00-23.jpg',
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('FaceBook 친구'),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('팔로우')),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
