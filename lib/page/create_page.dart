import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
          IconButton(onPressed: () {
            _uploadPost(context);
          }, icon: Icon(Icons.send)),
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

  // 파일 storage에 업로드 & firestore 저장
  Future<void> _uploadPost(BuildContext context) async {
     final user = FirebaseAuth.instance.currentUser;
    //var user = context.read<GoogleSignInProvider>();

    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('post')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = await firebaseStorageRef.putFile(
        _image!, SettableMetadata(contentType: 'image/png'));

    // downloadUrl 을 얻음
    final uri = await task.ref.getDownloadURL();

    // Data Write . post collection 은 만들어진다.
    final doc = FirebaseFirestore.instance.collection('post').doc();

    // json Map 형태로 넣는다.
    await doc.set({
      // Id 정보를 알수있다.
      'id': doc.id,
      'photoUrl': uri.toString(),
      'contents': textEditingController.text,
      'email': user!.email,
      'displayName': user.displayName,
      'userPhotoUrl': user.photoURL
    }).then((value) => print('Success ---- Add Post'));

    // 완료 후 앞 화면으로 이동
    Navigator.pop(context);
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

  // 갤러리이미지 ImagePicker
  Future<void> _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if(image != null) {
        // XFile 을 File 로~
        _image = File(image.path);
        // _image = image as File; // failed
      } else {
        print('error : 파일을 가져오지 못했습니다. ');
      }
    });
  }
}
