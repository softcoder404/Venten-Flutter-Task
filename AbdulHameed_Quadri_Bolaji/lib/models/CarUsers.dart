class CarUsers {
  final id;
  final String firstName;
  final String lastName;
  final String email;
  final String country;
  final String carModel;
  final int carModelYear;
  final String carColor;
  final String gender;
  final String jobTitle;
  final String bio;
  CarUsers(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.country,
      this.gender,
      this.carModel,
      this.carModelYear,
      this.carColor,
      this.jobTitle,
      this.bio});
  factory CarUsers.fromDynamicList(List<dynamic> dataList) => CarUsers(
      id: dataList[0],
      firstName: dataList[1],
      lastName: dataList[2],
      email: dataList[3],
      country: dataList[4],
      carModel: dataList[5],
      carModelYear: dataList[6],
      carColor: dataList[7],
      gender: dataList[8],
      jobTitle: dataList[9],
      bio: dataList[10]);
}
