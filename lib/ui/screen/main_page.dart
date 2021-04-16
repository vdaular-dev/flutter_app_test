import 'package:flutter/material.dart';
import 'package:flutter_app_test/constant.dart';
import 'package:flutter_app_test/model/user.dart';
import 'package:flutter_app_test/ui/screen/add_user_page.dart';
import 'package:flutter_app_test/ui/screen/loading_screen.dart';
import 'package:flutter_app_test/ui/widget/custom_card.dart';

class MainPage extends StatefulWidget {
  final userData;

  MainPage({this.userData});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  User user = User();

  @override
  Widget build(BuildContext context) {
    dynamic userData = widget.userData;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Created User List',
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoadingScreen()));
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kAccentColor,
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUserPage(),
            ),
          );
          //TODO: UPDATE DATA WHEN POP TO MAIN PAGE
          if (userData != null) {
            userData = userData;
          }
        },
      ),
      //TODO: UPGRADE TO PAGINATION-ABLE
      body: ListView.builder(
        itemCount: userData['data']['rows'].length,
        itemBuilder: (context, index) {
          final _data = userData['data']['rows'][index];
          return CustomCard(
            name: '${_data['fullname']}',
            email: '${_data['email']}',
            gender:
                '${_data['gender'] == 1 ? 'Male' : _data['gender'] == 2 ? 'Female' : null}',
            dob: '${_data['dob']}',
          );
        },
      ),
    );
  }
}
