import 'package:flutter/material.dart';
import '../common/gm_localizations.dart';
import '../common/global.dart';
import 'package:provider/provider.dart';
import '../providers/profile_change_notifier.dart';

import '../index.dart';


class ThemeChangeRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).theme),
      ),
      body: ListView( //显示主题色块
        children: Global.themes.map<Widget>((e) {
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              //主题更新后，MaterialApp会重新build
              Provider.of<ThemeModel>(context, listen: false).theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}