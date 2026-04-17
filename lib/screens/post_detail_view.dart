import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_flutter/helper/app_colors.dart';
import 'package:task_flutter/helper/size.dart';
import '../model/post_model.dart';

class PostDetailView extends StatelessWidget {
  final PostModel post;

  const PostDetailView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.white,
            size: 20,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          "Post Detail",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(width(context) * 0.05),
        child: Container(
          padding: EdgeInsets.all(width(context) * 0.05),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: height(context) * 0.02),
              Text(
                post.body,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}