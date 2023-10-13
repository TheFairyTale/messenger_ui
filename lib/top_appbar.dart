import 'package:flutter/material.dart';

class TopAppbar extends StatelessWidget {
  const TopAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    /// 实现顶部应用栏。顶部从左到右依次是头像、标题、按钮三个部分，所以使用Row组件放在外边
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: CircleAvatar(
            //图片原型裁切
            radius: 25, //圆形大小
            backgroundColor: Colors.white, // 背景白色
            backgroundImage: NetworkImage(
                "http://q.qlogo.cn/headimg_dl?dst_uin=986920241&spec=640&img_type=jpg"),
          ),
        ),
        Text(
          "聊天",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Icon(Icons.add),
        )
      ],
    );
  }
}
