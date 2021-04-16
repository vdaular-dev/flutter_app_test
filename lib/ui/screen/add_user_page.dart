import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/constant.dart';
import 'package:flutter_app_test/model/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddUserPage extends StatefulWidget {
  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  User user = User();
  DateTime _datePick;
  bool _isChecked = false;
  bool _showModal = false;

  final _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Function _onTap = () async {
      _datePick = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1900),
          lastDate: new DateTime(2100));
      if (_datePick != null) {
        _dateController.text = DateFormat('yyyy-MM-dd').format(_datePick);
      }
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Add User Page'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _showModal,
        opacity: 0.5,
        progressIndicator: SpinKitFadingCube(
          size: 50.0,
          color: kAccentColor,
        ),
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ListView(children: [
                    Container(
                      height: 450.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Name is required';
                              } else if (!RegExp(r"^[A-Za-z ]+$")
                                  .hasMatch(value)) {
                                return 'Alphabetical Only';
                              } else if (value.length < 3) {
                                return 'Must be at least 3 characters';
                              }
                              return null;
                            },
                            decoration: kAddUserTextInputDecoration.copyWith(
                                hintText: 'Full Name'),
                            onChanged: (value) {
                              user.fullName = value;
                            },
                            onSaved: (value) {
                              user.fullName = value;
                            },
                          ),
                          DropdownButtonFormField(
                            validator: (value) {
                              if (value == null) {
                                return 'Gender is required';
                              }
                              return null;
                            },
                            decoration: kAddUserTextInputDecoration.copyWith(
                                hintText: 'Gender'),
                            items: [
                              DropdownMenuItem(
                                child: Text('Male'),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text('Female'),
                                value: 2,
                              )
                            ],
                            onSaved: (value) {
                              setState(() {
                                user.gender = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                user.gender = value;
                              });
                            },
                          ),
                          InkWell(
                            onTap: _onTap,
                            child: IgnorePointer(
                              child: TextFormField(
                                controller: _dateController,
                                keyboardType: TextInputType.datetime,
                                decoration:
                                    kAddUserTextInputDecoration.copyWith(
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(width: 1.0),
                                  ),
                                  hintText: 'Date of Birth',
                                  contentPadding: EdgeInsets.only(
                                      right: 48,
                                      left: 12.0,
                                      top: 12.0,
                                      bottom: 12.0),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Date of Birth is Required';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  user.dateOfBirth = value;
                                },
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: kAddUserTextInputDecoration.copyWith(
                                hintText: 'Email'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Email is Required';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              user.email = value;
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: kAddUserTextInputDecoration.copyWith(
                                hintText: 'Password'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Password is Required';
                              } else if (!RegExp(
                                      r"(?:\d+[a-z]|[a-z]+\d)[a-z\d]*")
                                  .hasMatch(value)) {
                                return 'Must be Alphanumeric';
                              } else if (value.length < 6) {
                                return 'Minimal 6';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              user.password = value;
                            },
                            onSaved: (value) {
                              user.password = value;
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            decoration: kAddUserTextInputDecoration.copyWith(
                                hintText: 'Confirm Password'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Confirm Password is Required';
                              } else if (user.password != value) {
                                return 'Password doesn\'t same';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              user.confirmPassword = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      fillColor: MaterialStateProperty.all(kAccentColor),
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value;
                        });
                      },
                    ),
                    Text('Agree'),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                MaterialButton(
                  height: 50.0,
                  color: kAccentColor,
                  shape: StadiumBorder(),
                  disabledTextColor: Colors.black26,
                  textColor: Colors.white,
                  child: Text(
                    'Add User',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: !_isChecked
                      ? null
                      : () async {
                          setState(() {
                            _showModal = true;
                          });
                          if (!(_formKey.currentState.validate())) {
                            setState(() {
                              _showModal = false;
                            });
                            return;
                          }
                          _formKey.currentState.save();
                          print(user.password);
                          Map<String, dynamic> body = {
                            "fullname": user.fullName,
                            "email": user.email,
                            "password": md5
                                .convert(utf8.encode(user.password))
                                .toString(),
                            "gender": user.gender.toString(),
                            "dob": user.dateOfBirth,
                          };
                          user.postData(body);
                          var userData = await user.readData();
                          setState(() {
                            _showModal = false;
                          });
                          Navigator.pop(context, userData);
                        },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
