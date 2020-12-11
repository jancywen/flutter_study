import 'package:flutter/material.dart';

import 'index.dart';

Map<String, Widget Function(BuildContext)> routeList = {
    "/finance_home": (context) => FinanceHomePage(),
    "/login_page": (context) => LoginPage(),
    "/apply_page": (context) => ApplyPage(),
    "/apply_result":(context) => ApplyResultPage(),
    "/personal_info":(context) => PersonalInfo(),
  };