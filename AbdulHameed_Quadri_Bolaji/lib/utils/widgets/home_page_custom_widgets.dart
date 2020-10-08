import 'package:AbdulHameed_Quadri_Bolaji/scoped_model/FilterModel.dart';
import 'package:flutter/material.dart';
import 'filter_card.dart';

Widget errorWidget ()=> ListView(
  children: [
    Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.only(top: 80.0),
      child: Image.asset(
        'assets/images/error.png',
      ),
    ),
    Center(
        child: Text(
          'No filters found!',
          style: TextStyle(fontWeight: FontWeight.w500),
        )),
    Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Please Pull Down To Refresh Page',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
  ],
);

Widget loadingProgress() => Center(
  child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Color(0xffFF4D52)),
    backgroundColor: Colors.white38,
  ),
);

Widget buildListView(AppScopedModel model) => ListView.builder(
    itemCount: model.filter.length,
    itemBuilder: (BuildContext context, int index) =>
        FilterCard(filter: model.filter[index], model: model));
