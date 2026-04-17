import 'package:get/get.dart';
import '../screens/post_list_view.dart';
import '../screens/post_detail_view.dart';

class AppRoutes {
  static const list = "/list";
  static const detail = "/detail";

  static final List<GetPage> pages = [
    GetPage(name: list, page: () => PostListView()),
    GetPage(name: detail, page: () => PostDetailView(post: Get.arguments)),
  ];
}