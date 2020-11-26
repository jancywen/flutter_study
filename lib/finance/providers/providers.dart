import 'index.dart';

import 'package:provider/provider.dart';
import 'package:nested/nested.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider(),),
];