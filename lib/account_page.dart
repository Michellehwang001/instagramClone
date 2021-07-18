import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
        ],
      ),
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
                    maxRadius: 70.0,
                    backgroundImage: NetworkImage(
                        'https://lh3.googleusercontent.com/proxy/ZVoc4m6hYeSfW0T_nSHPkCNfe5EnMYU5PiGS3JqX0crAym6mcJ1F6B6Y5mVRAEVRTe3zQvf0m6-p1UqpLcT4Q6GpzqobsqZAhizqOUzr3ssVMhjGwDEvH8mMlsB2AY5YGNedjOfXp3BpnA'),
                  ),
                  Container(
                    width: 130.0,
                    height: 130.0,
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
                '이름',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '0\n게시물',
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
