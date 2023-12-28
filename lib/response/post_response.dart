import 'package:project_intern/models/post_model.dart';

class PostResponse {
  List<PostModel> listPost = [];

  PostResponse.fromRegres(regres) {
    for (int i = 0; i < regres.length; i++) {
      PostModel postModel = PostModel.fromRegres(regres[i]);
      listPost.add(postModel);
    }
  }
}
