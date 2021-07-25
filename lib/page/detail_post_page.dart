import 'package:flutter/material.dart';

class DetailPostPage extends StatelessWidget {
  const DetailPostPage({Key? key, this.document}) : super(key: key);
  final dynamic document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: BildBody(),
    );
  }

  Widget BildBody() {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(document['userPhotoUrl']),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document['email'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      document['displayName'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Hero(
              tag: document['photoUrl'],
              child: Image.network(document['photoUrl'])
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(document['contents']),
          ),
        ],
      ),
    ));
  }
}
