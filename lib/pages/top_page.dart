import 'package:fb_settings/pages/settings_profile.dart';
import 'package:fb_settings/pages/talk_room.dart';
import 'package:flutter/material.dart';
import '../model/user.dart';

class TopPage extends StatefulWidget {
  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

  List<User> userList = [
    User("田中",
        "abc",
        "https://1.bp.blogspot.com/-SWOiphrHWnI/XWS5x7MYwHI/AAAAAAABUXA/i_PRL_Atr08ayl9sZy9-x0uoY4zV2d5xwCLcBGAs/s1600/pose_dance_ukareru_man.png",
        "はろー２２"),
    User("小谷林",
        "furuta",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjZmVZCDolhaaWAC-nR2P3dAf1cWJvHphTug&usqp=CAU",
        "kobayashi!!"),
    User("木村",
        "wa-i",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjZmVZCDolhaaWAC-nR2P3dAf1cWJvHphTug&usqp=CAU",
        "あああ"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('チャットアプリ'),
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingProfile() ));
              },
              icon: Icon(Icons.settings)),
          ]
      ),
      body: ListView.builder(
        itemCount: userList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                print("たっぷ");
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        TalkRoom(userList[index].name)));
              },
              // コンテナをtapした時に遷移する処理を書くために wrap with widget
              child: Container(
                height: 90,
                child: Row(
                  children: [
                    Padding(
                      // 縦方向は vertical 右はright, 左はleftというのはまんま
                      padding: const EdgeInsets.symmetric(horizontal: 8.0 ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(userList[index].imagePath),
                            radius: 30,
                ),
                    ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // 左詰
                        mainAxisAlignment:  MainAxisAlignment.center, // カラムに対してせんたー
                        children: [
                          Text(userList[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold) ,),
                          Text(userList[index].lastMessage, style:TextStyle(color: Colors.grey))
                        ],
                      ),
                  ],
                ),
              ),
            );
          }
        )
    );
  }
}
