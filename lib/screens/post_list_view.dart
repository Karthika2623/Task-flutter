import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_flutter/helper/app_colors.dart';
import 'package:task_flutter/helper/size.dart';
import 'package:task_flutter/routes/app_routes.dart';
import '../controller/post_controller.dart';
import 'post_detail_view.dart';

class PostListView extends StatelessWidget {
  PostListView({super.key});

  final controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Explore Posts",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          padding: EdgeInsets.all(width(context) * 0.04),
          itemCount: controller.postList.length,
          itemBuilder: (context, index) {
            final post = controller.postList[index];

            return InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Get.toNamed(AppRoutes.detail, arguments: post);
              },
              child: Container(
                margin: EdgeInsets.only(bottom: height(context) * 0.02),
                padding: EdgeInsets.all(width(context) * 0.05),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.gradient1, AppColors.gradient2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: width(context) * 0.05,
                      backgroundColor: Colors.white,
                      child: Text(
                        post.id.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: width(context) * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          SizedBox(height: height(context) * 0.01),
                          Text(
                            post.body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
