import 'package:flutter/material.dart';

/// 在应用栏下方添加一个搜索输入框。它将包含一个装饰有样式和搜索图标的小部件
class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({super.key});

// 由于需要一个小部件的文本控制器，因此我们需要先对其进行初始化
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      // 使用Container的BoxDecoration实现圆角效果
      decoration: BoxDecoration(
        color: const Color(0xFFe9eaec),
        borderRadius: BorderRadius.circular(15),

        // border: BoxBorder
        // boxShadow: [BoxShadow(color: Colors.white.withOpacity(0))],
        // [BoxShadow.lerp(BoxShadow(offset: 0, blurRadius: 0, blurStyle: BlurStyle.inner, bl), b, t)]
      ),
      child: TextField(
        cursorColor: const Color(0xFF000000),
        // 与类中定义的TextEditingController 控制器关联
        controller: _searchController,
        // TextField 文本装饰器InputDecoration
        decoration: InputDecoration(
          // 通过设置InputDecoration的prefixIcon 实现放大镜图标
          prefixIcon: Icon(
            Icons.search,
            color: const Color(0xFF000000).withOpacity(0.5),
          ),
          hintText: "搜索",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          _searchController.addListener(() {});
          var inputedText = _searchController.text;
        },
      ),
    );
  }
}
