import 'package:fb_settings/model/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class TalkRoom extends StatefulWidget {
  final String name;
  TalkRoom(this.name);

  @override
  State<TalkRoom> createState() => _TalkRoomState();
}

class _TalkRoomState extends State<TalkRoom> {

  List<Message> messageList = [
    Message(
        "あいうえお",
        true,
        DateTime(2022,1,3,22,20)),
    Message(
        "かきくけおｋかきくけおｋかきくけおｋかきくけおｋかきくけおｋ",
        false,
        DateTime(2022,1,4,1,44)),
    Message(
        "😭",
        true,
        DateTime(2022,1,3,22,20)),
    Message(
        "あいうえお",
        true,
        DateTime(2022,1,3,22,20)),
    Message(
        "あああああああああああああああああああああああああああああああ！！！！！！！！！！！（ﾌﾞﾘﾌﾞﾘﾌﾞﾘﾌﾞﾘｭﾘｭﾘｭﾘｭﾘｭﾘｭ！！！！！！ﾌﾞﾂﾁﾁﾌﾞﾌﾞﾌﾞﾁﾁﾁﾁﾌﾞﾘﾘｲﾘﾌﾞﾌﾞﾌﾞﾌﾞｩｩｩｩｯｯｯ！！！！！！！）  ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ",
        false,
        DateTime(2022,1,4,1,44)),
    Message(
        "😭",
        true,
        DateTime(2022,1,3,22,20)),
    Message(
        "ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ",
        false,
        DateTime(2022,1,4,1,44)),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60.0),
            child: ListView.builder(
              physics: RangeMaintainingScrollPhysics(),
              shrinkWrap: true,
              reverse: true,
              itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(top: 40,right: 10,left: 10, bottom: index == 0 ? 120.0 : 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      textDirection: messageList[index].isMe ? TextDirection.rtl : TextDirection.ltr,
                      children: [
                        Container(
                          // 横幅を画面幅の最大で 0.6 バイまでにしとめる
                          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.6),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical:  6.0),
                          decoration: BoxDecoration(
                            color: messageList[index].isMe ? Colors.white : Colors.green,
                            borderRadius:  BorderRadius.circular(20)
                          ),
                            child: Text(messageList[index].message)
                        ),
                        // Intl は pubsec.yaml にてゆうこうにしてうｒ
                        Text(intl.DateFormat('HH:mm').format(messageList[index].sendTime))
                      ],
                    ),
                  );
                }
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:  80, color: Colors.white,
              child: Row(
                children: [
                  Expanded(child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder()
                      ),
                    ),
                  )),
                  IconButton(
                      onPressed: (){print("aaaa");},
                      icon: Icon(Icons.send),
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}
