import 'package:flutter/material.dart';
import 'scoped_model/FilterModel.dart';
import 'views/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = AppScopedModel();
    return ScopedModel<AppScopedModel>(
      model: model,
      child: MaterialApp(
        title: "Venten App Task",
        debugShowCheckedModeBanner: false,
        home: HomePage(model),
      ),
    );
  }
}
