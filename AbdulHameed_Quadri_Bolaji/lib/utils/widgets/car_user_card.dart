import 'package:flutter/material.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:google_fonts/google_fonts.dart';

class CarUsersCard extends StatelessWidget {
  final String name;
  final String email;
  final String gender;
  final String country;
  final String carColor;
  final String carMake;
  final String carYear;
  final String bio;
  final String job;
  CarUsersCard(
      {this.name,
      this.email,
      this.gender,
      this.country,
      this.carColor,
      this.carYear,
      this.carMake,
      this.job,
      this.bio});

  final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: SimpleFoldingCell.create(
              key: _foldingCellKey,
              frontWidget: _buildFrontWidget(),
              innerWidget: _buildInnerWidget(),
              cellSize: Size(MediaQuery.of(context).size.width, 180),
              padding: EdgeInsets.all(15),
              animationDuration: Duration(milliseconds: 300),
              borderRadius: 10,
              onOpen: () => print('cell opened'),
              onClose: () => print('cell closed'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFrontWidget() {
    return Container(
      color: Color.fromRGBO(253, 237, 244, 1.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 110.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                      gender == "Male"
                          ? 'assets/images/male.png'
                          : 'assets/images/female.png',
                      fit: BoxFit.cover),
                ),
                SizedBox(width: 12.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${name ?? "Fullname"}",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF2e282a),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxWidth: 220),
                      child: Text(
                        "${email ?? "Email"}",
                        overflow: TextOverflow.visible,
                        style: GoogleFonts.poppins(
                          color: Color(0xFF2e282a),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      "${country ?? "Country"}",
                      style: GoogleFonts.poppins(
                        color: Color(0xFF2e282a),
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: [
                Icon(Icons.work, size: 22.0),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    "${job ?? "Job Role"}",
                    style: GoogleFonts.poppins(
                      color: Color(0xFF2e282a),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(width: 15.0),
              Expanded(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Image.asset('assets/images/car.png',
                          fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "${carColor ?? "Car color"}",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF2e282a),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${carMake ?? "Car Make"}",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF2e282a),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        "${carYear ?? "Year"}",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF2e282a),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: FlatButton(
                  onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
                  child: Text(
                    "Bio Data",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textColor: Colors.white,
                  color: Color.fromRGBO(247, 84, 96, 1.0),
                  splashColor: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildInnerWidget() {
    return Container(
      color: Color.fromRGBO(253, 237, 244, 1.0),
      padding: EdgeInsets.only(top: 20),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "BIO DATA",
              style: GoogleFonts.aldrich(
                color: Color(0xFF2e282a),
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "${bio ?? "Bio Data"}",
                style: GoogleFonts.poppins(
                  color: Color(0xFF2e282a),
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: FlatButton(
              onPressed: () => _foldingCellKey?.currentState?.toggleFold(),
              child: Text(
                "Close",
              ),
              textColor: Colors.white,
              color: Color.fromRGBO(247, 84, 96, 1.0),
              splashColor: Colors.white.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
