import 'package:AbdulHameed_Quadri_Bolaji/utils/widgets/home_page_custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../models/Filter.dart';
import '../network/network_helper.dart';
import '../scoped_model/FilterModel.dart';
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
  Future<void> fetchCarOwner()async=> await widget.model.getListOfCarUsers();
  @override
  void initState() {
    super.initState();
    fetchCarOwner();
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
          Widget widgetToRender;
          if (model.isLoading) {
            widgetToRender = loadingProgress();
          } else if (!model.isLoading && model.filter.length > 0) {
            widgetToRender = buildListView(model);
          } else {
            widgetToRender = errorWidget();
          }
          return widgetToRender;
        }),
      ),
    );
  }
}
