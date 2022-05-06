

import 'package:flutter/material.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({Key? key}) : super(key: key);

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("プロフィール編集"),
      ),
      body : Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(width : 100,child: Text("名前")),
                // 名前フィールドの Expand で field. Widget でラップして、 Expand に書き換える
                Expanded(child:  TextField())
              ],
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                Container(width: 100 ,child: Text("サムネイル")),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 150 , height: 40,
                      child: ElevatedButton(
                          onPressed: (){
                            print("💩ぷれすぼたん");
                          },
                          child: Text("画像を選択")
                      ),
                    ),
                  ),
                )

              ],
            )
          ],
        ),
      )

    );
  }
}
