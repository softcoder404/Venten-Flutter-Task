import 'package:flutter/material.dart';
import '../models/Filter.dart';
import '../scoped_model/FilterModel.dart';
import '../utils/widgets/car_user_card.dart';
import 'package:scoped_model/scoped_model.dart';

class CarOwnersPage extends StatefulWidget {
  final AppScopedModel model;
  final Filter filter;
  CarOwnersPage({@required this.model, this.filter});
  @override
  _CarOwnersPageState createState() => _CarOwnersPageState();
}

class _CarOwnersPageState extends State<CarOwnersPage> {
  @override
  void initState() {
    super.initState();
    widget.model.filterCarUsers(widget.model.carUsers, widget.filter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffFF4D52).withOpacity(.8),
        title: Text("${widget.model.filteredCarUsers.length} Car Owners"),
      ),
      body: ScopedModelDescendant<AppScopedModel>(
          builder: (BuildContext context, Widget child, AppScopedModel model) {
        Widget widgetToRender = Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/images/empty.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'No Car Owner Matched With Filters!',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
        if (model.isLoading) {
          widgetToRender = Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Color(0xffFF4D52)),
              backgroundColor: Colors.white38,
            ),
          );
        } else if (!model.isLoading && model.filteredCarUsers.length > 0) {
          widgetToRender = _buildListView(model);
        }
        return widgetToRender;
      }),
    );
  }

  Widget _buildListView(AppScopedModel model) => ListView.builder(
      itemCount: model.filteredCarUsers.length,
      itemBuilder: (BuildContext context, int index) => CarUsersCard(
            name:
                "${model.filteredCarUsers[index].firstName} ${model.filteredCarUsers[index].lastName}",
            email: "${model.filteredCarUsers[index].email}",
            gender: "${model.filteredCarUsers[index].gender}",
            country: "${model.filteredCarUsers[index].country}",
            job: "${model.filteredCarUsers[index].jobTitle}",
            carColor: "${model.filteredCarUsers[index].carColor}",
            carMake: "${model.filteredCarUsers[index].carModel}",
            carYear: "${model.filteredCarUsers[index].carModelYear}",
            bio: "${model.filteredCarUsers[index].bio}",
          ));
}
