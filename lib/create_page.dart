import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void dispose() {
    // 메모리 해제
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.send)),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {
          _getImage();
        },
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _image == null ? Text('No Image') : Image.file(_image!),
        TextField(
          decoration: InputDecoration(hintText: '내용을 입력하세요.'),
          controller: textEditingController,
        ),
      ],
    );
  }

  Future<void> _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      // XFile 을 File 로~
      _image = File(image!.path);
      print('_image 값들어옴');
    });
  }
}
