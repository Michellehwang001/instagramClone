import 'package:flutter/material.dart';
import 'package:instagram_clone/create_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.create),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePage()),
            );
        },
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // 열의 개수
          crossAxisCount: 3,
          // 가로 세로 비율 1.0 정사각형 1:1 비율
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItems(context, index);
        });
  }

  Widget _buildListItems(BuildContext context, int index) {
    return Image.network(
      'http://www.nbnnews.co.kr/news/photo/202010/431596_475596_185.jpg',
      fit: BoxFit.cover,
    );
  }
}
