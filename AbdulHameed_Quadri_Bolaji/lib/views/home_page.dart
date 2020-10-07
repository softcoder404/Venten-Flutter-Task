import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../models/Filter.dart';
import '../network/network_helper.dart';
import '../scoped_model/FilterModel.dart';
import '../utils/widgets/filter_card.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  final AppScopedModel model;
  HomePage(this.model);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Filter>> getAllFilters() async {
    return await NetworkHelper.fetchFilters();
  }

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  @override
  void initState() {
    super.initState();
    widget.model.getListOfCarUsers();
    widget.model.getFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.filter_list),
        title: Text('My Filters'),
        backgroundColor: Color(0xffFF4D52).withOpacity(.8),
      ),
      body: LiquidPullToRefresh(
        key: _refreshIndicatorKey,
        onRefresh: widget.model.getFilters,
        showChildOpacityTransition: true,
        height: 50.0,
        color: Color(0xffFF4D52).withOpacity(.8),
        child: ScopedModelDescendant<AppScopedModel>(builder:
            (BuildContext context, Widget child, AppScopedModel model) {
          Widget widgetToRender = ListView(
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
          if (model.isLoading) {
            widgetToRender = Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Color(0xffFF4D52)),
                backgroundColor: Colors.white38,
              ),
            );
          } else if (!model.isLoading && model.filter.length > 0) {
            widgetToRender = _buildListView(model);
          }
          return widgetToRender;
        }),
      ),
    );
  }

  Widget _buildListView(AppScopedModel model) => ListView.builder(
      itemCount: model.filter.length,
      itemBuilder: (BuildContext context, int index) =>
          FilterCard(filter: model.filter[index], model: widget.model));
}
