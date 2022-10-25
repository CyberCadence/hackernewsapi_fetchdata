// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hackerapi_fetchdata/service/enum.dart';
import 'package:http/http.dart'as http;


import '../model/Newsmodeldata.dart';
import 'constants.dart';

class Repository {


final NewsType newsType;
  Repository({
      this.newsType=NewsType.topStories,
  });


 ///Function used to access stories which returns `List<Story>`
  Future<List<Story>> getStories() async {
    final List<http.Response> responses = await _getStories();

    final List<Story> stories = responses.map((response) {
      final json = jsonDecode(response.body);

      return Story.fromJson(json);
    }).toList();
    return stories;
  }

 
 
 
  ///Function used to access single story by using storyID
  Future<Story> getStory(int storyID) async {
    http.Response response = await _getStory(storyID);

    final json = jsonDecode(response.body);

    return Story.fromJson(json);
  }

  ///Function used to access list of storyIds
  Future<List<dynamic>> getStoryIds() async {
    final response = await http.get(storyUrl(newsType));

    if (response.statusCode == 200) {
      dynamic storyIds = jsonDecode(response.body);

      return storyIds;
    } else {
      throw Exception("Unable to fetch data! ${response.statusCode}");
    }
  }

  ///Function used to access story kids and return `List<Comments>`
  Future<List<Comment>> getComments(List<dynamic> kidIds) async {
    final List<http.Response> responses = await _getComments(kidIds);

    final List<Comment> stories = responses.map((response) {
      final json = jsonDecode(response.body);

      return Comment.fromJson(json);
    }).toList();

    return stories;
  }

  Future<List<http.Response>> _getStories() async {
    final response = await http.get(storyUrl(newsType));

    if (response.statusCode == 200) {
      Iterable storyIds = jsonDecode(response.body);

      return Future.wait(storyIds.take(30).map((storyId) {
        return _getStory(storyId);
      }));
    } else {
      throw Exception("Unable to fetch data! ${response.statusCode}");
    }
  }

  ///Function used to access single story by using storyID
  Future<http.Response> _getStory(int storyId) {
    return http.get(urlForStory(storyId));
  }

  Future<List<http.Response>> _getComments(List<dynamic> kidIds) async {
    return Future.wait(kidIds.take(30).map((kidId) {
      return http.get(urlForStory(kidId));
    }));
  }
}






