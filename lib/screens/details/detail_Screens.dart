import 'package:flutter/material.dart';
class DetailScreens extends StatelessWidget {
  final String fullName;
  final String lastName;
  final String gender;
  final String country;
  final String hobby;

  const DetailScreens({
    super.key,
    required this.fullName,
    required this.lastName,
    required this.gender,
    required this.hobby,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("FullName: $fullName"),
            Text("LastName: $lastName"),
            Text("Gender: $gender"),
            Text("Country: $country"),
            Text("Hobbys: $hobby"),
          ],
        ),
      ),
    );
  }
}
