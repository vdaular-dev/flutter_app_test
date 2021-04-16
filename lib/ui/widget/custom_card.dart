import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String email;
  final String gender;
  final String dob;

  CustomCard({this.gender, this.email, this.name, this.dob});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
                color: Colors.black26, offset: Offset(4, 5), blurRadius: 4)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Name: $name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text('Email: $email'),
          Text('Gender: $gender'),
          Text('Date of Birth: $dob')
        ],
      ),
    );
  }
}
