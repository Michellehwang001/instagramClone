import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser;
  int _pageCount = 0;

  @override
  void initState() {
    super.initState();
    // 단발성 한번만 읽어 오기
    FirebaseFirestore.instance.collection('post').where('email', isEqualTo: user!.email).get().then((snapshot) {
      setState(() {
        _pageCount = snapshot.docs.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage('${user!.photoURL}'),
                  ),
                  Container(
                    width: 90.0,
                    height: 90.0,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                            width: 34.0,
                            height: 34.0,
                            child: FloatingActionButton(
                              backgroundColor: Colors.white, onPressed: () {  },
                            ),
                        ),
                        SizedBox(
                            width: 30.0,
                            height: 30.0,
                            child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.add),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                '${user!.displayName}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '$_pageCount\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
