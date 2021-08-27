import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage2 extends StatelessWidget {
  const SearchPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Instagram Clone',
      //     style: GoogleFonts.pacifico(),
      //   ),
      // ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.create),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final Stream<QuerySnapshot> _postStream =
        FirebaseFirestore.instance.collection('post').snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: _postStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // if (!snapshot.hasData) {
          //   return Center(
          //     child: Text('데이터가 없습니다.'),
          //   );
          // }

          if (!snapshot.hasError)
            return const Text('Firestore snapshot has error..');

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null) {
            return Center(child: const Text('Snapshot.data is null...'));
          } else {
            var items = snapshot.data!.docs;

            // 데이터가 있는 경우
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0, // 비율 1:1
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    items[index]['photoUrl'],
                    fit: BoxFit.cover,
                  );
                });
          }
        });
  }

  Widget _buildListItem(QueryDocumentSnapshot<Object> queryDocumentSnapshot) {
    return Image.network(
      queryDocumentSnapshot['photoUrl'],
      fit: BoxFit.cover,
    );
  }
}
