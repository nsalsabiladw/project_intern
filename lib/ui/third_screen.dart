import 'package:flutter/material.dart';
import 'package:project_intern/models/post_model.dart';
import 'package:project_intern/response/post_response.dart';
// import 'package:project_intern/ui/second_screen.dart';

import '../service/api_service.dart';

class ThirdScreen extends StatelessWidget {
  final Function(String) updateSelectedUserName;
  ThirdScreen({Key? key, required this.updateSelectedUserName}) : super(key: key);
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Screen'),
        ),
        body: FutureBuilder(
          future: apiService.getPosts(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              //simpan dlu data ke dalam model post response
              PostResponse postResponse = snapshot.data;
              //lalu buat dalam bentuk list yang isinya postrespone.listpost
              List<PostModel> listPost = postResponse.listPost;
              //lalu tampilkan datanya
              return ListView.builder(
                //item count menunjukkan berapa banyak sih data
                //item builder menampilkan datanya
                itemCount: listPost.length,
                itemBuilder: (context, index) {
                  PostModel postModel = listPost[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(postModel.avatar.toString()), // Use NetworkImage for loading image from URL
                    ),
                    title: Text(
                      '${postModel.first_name.toString()} ${postModel.last_name.toString()}',
                    ),
                    subtitle: Text(
                      postModel.email.toString(),
                    ),
                    onTap: () {
                      String selectedUserName =
                          postModel.first_name.toString() +
                              ' ' +
                              postModel.last_name.toString();
                      Navigator.pop(context, selectedUserName);
                      updateSelectedUserName(selectedUserName);
                    },
                  );
                },
              );
            }
            return Container();
          },
        ));
  }
}
