import 'package:flutter/material.dart';
import '../../models/Filter.dart';
import '../../scoped_model/FilterModel.dart';
import '../../utils/UtilsHelper.dart';
import '../../views/car_owners.dart';

class FilterCard extends StatelessWidget {
  final Filter filter;
  final AppScopedModel model;
  FilterCard({@required this.filter, @required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) =>
              CarOwnersPage(model: model, filter: filter))),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color(0xffFDE6EE).withOpacity(.5),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xffFDE6EE),
              offset: Offset(0.0, 2.0), //(x,y)
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date Range : ${filter.startYear} - ${filter.endYear}',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .apply(color: Color(0xff475875))),
            SizedBox(height: 12.0),
            Text('Gender : ${filter.gender == '' ? 'All' : filter.gender}',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .apply(color: Color(0xff475875))),
            SizedBox(height: 12.0),
            Text(
                'Countries : ${UtilsHelper.extractStringFromList(filter.countries)}',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .apply(color: Color(0xff475875))),
            SizedBox(height: 12.0),
            Text('Colors : ${UtilsHelper.extractStringFromList(filter.colors)}',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .apply(color: Color(0xff475875))),
          ],
        ),
      ),
    );
  }
}
