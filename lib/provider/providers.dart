import 'index.dart';
import 'package:provider/provider.dart';
import 'package:nested/nested.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ExampleProvider>(create: (_) => ExampleProvider(),),

  ChangeNotifierProvider<ExampleSimpleProvider1>(create: (_) => ExampleSimpleProvider1(),),
  ChangeNotifierProvider<ExampleSimpleProvider2>(create: (_) => ExampleSimpleProvider2(),),
  ChangeNotifierProvider<ExampleSimpleProvider3>(create: (_) => ExampleSimpleProvider3(),),

];