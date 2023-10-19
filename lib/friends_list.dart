import 'package:flutter/material.dart';

class FriendsListWidget extends StatefulWidget {
  const FriendsListWidget({super.key});

  @override
  State<FriendsListWidget> createState() => _FriendsListWidgetState();
}

class _FriendsListWidgetState extends State<FriendsListWidget> {
  List conversationList = [
    {
      "name": "童话的爱",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=986920241&spec=640&img_type=jpg",
      "isOnline": true,
      "message": "Time",
      "time": "11:21 am"
    },
    {
      "name": "kagura debu",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=2105614530&spec=640&img_type=jpg",
      "isOnline": true,
      "message": "Time",
      "time": "10:01 am"
    },
    {
      "name": "想吃瓜的kin酱",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=1531858086&spec=640&img_type=jpg",
      "isOnline": false,
      "message": "Time",
      "time": "yesterday"
    },
    {
      "name": "Kanade Saigo",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=1459010632&spec=640&img_type=jpg",
      "isOnline": false,
      "message": "Time",
      "time": "saturday"
    },
    {
      "name": "大残是你的谎言",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=2139415797&spec=640&img_type=jpg",
      "isOnline": false,
      "message": "Time",
      "time": "tuesday"
    },
    {
      "name": "歹七",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=2184390236&spec=640&img_type=jpg",
      "isOnline": false,
      "message": "Time",
      "time": "tuesday"
    },
    {
      "name": "[Minecraft]Create ...",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=754074796&spec=640&img_type=jpg",
      "isOnline": true,
      "message": "Time",
      "time": "now"
    },
    {
      "name": "MC洋葱种植学习",
      "image":
          "http://q.qlogo.cn/headimg_dl?dst_uin=940127070&spec=640&img_type=jpg",
      "isOnline": true,
      "message": "Time",
      "time": "now"
    },
  ];

  @override
  Widget build(BuildContext context) {
    _dealconversationList();

    // 聊天消息列表
    return Column(
      children: List.generate(conversationList.length, (index) {
        return Padding(
            padding: EdgeInsets.zero,
            child: InkWell(
                onTap: () {
                  print("object $index");
                  // 打开一个页面
                  // Navigator.of(context).push();
                },
                hoverColor: const Color.fromARGB(255, 172, 200, 228),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 2.5, 0, 2.5),
                  child: Row(children: [
                    Container(
                      width: 65,
                      height: 60,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 215, 217, 219),
                                    width: 3)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 75,
                                height: 75,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          conversationList[index]['image'],
                                        ),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                          // 选择在线的人员并显示在列表前一部分
                          conversationList[index]['isOnline']
                              ? Positioned(
                                  top: 38,
                                  left: 42,
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF66BB6A),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: const Color(0xFFFFFFFF),
                                            width: 3)),
                                  ))
                              : Positioned(
                                  top: 38,
                                  left: 42,
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 174, 177, 174),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: const Color(0xFFFFFFFF),
                                              width: 3))),
                                )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      // 将项目按左对齐排列
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          conversationList[index]['name'],
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          // 这个的作用是？
                          // width: MediaQuery.of(context).size.width - 135,
                          child: Text(
                            conversationList[index]['message'] +
                                " - " +
                                conversationList[index]['time'],
                            style: TextStyle(
                                fontSize: 15,
                                color:
                                    const Color(0xFF000000).withOpacity(0.7)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    )
                  ]),
                )));
      }),
    );
  }

  /// 定义_dealconversationList()函数对conversationList里面的数据根据isOnline属性进行排序。
  _dealconversationList() {
    conversationList.sort(
        // 该排序似乎依赖前两个项目的isOnline 标识？如果前两个都是true 则接下来的对比才会
        // 将isOnline = false的排后面？
        (a, b) => b["isOnline"].toString().compareTo(a["isOnline"].toString()));
  }
}
