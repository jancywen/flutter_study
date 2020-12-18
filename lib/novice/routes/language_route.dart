import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/profile_change_notifier.dart';
import '../common/gm_localizations.dart';

import '../index.dart';

class LanguageRoute extends StatefulWidget {
  @override
  _LanguageRouteState createState() => _LanguageRouteState();
}

class _LanguageRouteState extends State<LanguageRoute> {
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var localeModel = Provider.of<LocalModel>(context);
    var gm = S.of(context);
    //构建语言选择项
    Widget _buildLanguageItem(String lan, value) {
      return ListTile(
        title: Text(
          lan,
          // 对APP当前语言进行高亮显示
          style: TextStyle(color: localeModel.locale == value ? color : null),
        ),
        trailing:
            localeModel.locale == value ? Icon(Icons.done, color: color) : null,
        onTap: () {
          // 更新locale后MaterialApp会重新build
          localeModel.locale = value;
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(gm.language),
      ),
      body: ListView(
        children: <Widget>[
          _buildLanguageItem("中文简体", "zh_CH"),
          _buildLanguageItem("English", "en_US"),
          _buildLanguageItem(gm.auto, null),
        ],
      ),
    );
  }
}