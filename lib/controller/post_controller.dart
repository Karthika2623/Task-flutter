import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/post_model.dart';


class PostController extends GetxController {
  var postList = <PostModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      isLoading(true);

      final response = await http.get(
        Uri.parse('http://jsonplaceholder.typicode.com/posts'),
      );

      debugPrint("STATUS: ${response.statusCode}");

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);

        postList.value = data.map((e) => PostModel.fromJson(e)).toList();
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      isLoading(false);
    }
  }
}