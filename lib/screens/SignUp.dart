import '../models/FavoriteSetting.dart';
import '../generated/l10n.dart';
import '../models/ValidateFunctions.dart';
import '../screens/LogIn.dart';
import '../utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  static const id = "signup";
  String userName = "";
  String phone = "";
  String age = "";
  String password = "";
  String email = "";
  final _formKey = GlobalKey<FormState>();
  bool isFormEmpty() {
    if (userName == "" &&
        phone == "" &&
        age == "" &&
        password == "" &&
        email == "")
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() {
      if (isFormEmpty()) return Future<bool>.value(true);
      return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
                content: Text(
                    "Are you sure you want to abandon the form? Any changes will be lost."),
                actions: <Widget>[
                  ElevatedButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ElevatedButton(
                    child: Text("Abandon"),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                ],
              ) ??
              false;
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(S.of(context).sign_up),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          onWillPop: _onWillPop,
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(60.0),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: '',
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onChanged: (value) {
                    userName = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).userName,
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColors.formIcon,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onChanged: (value) {
                    phone = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).phone,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: AppColors.formIcon,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    return ValidateFunctions.validatePhone(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onChanged: (value) {
                    age = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).age,
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: AppColors.formIcon,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    return ValidateFunctions.validateAge(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  onSaved: (value) {
                    //  myData.add(value);
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).email,
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.formIcon,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  validator: (value) {
                    return ValidateFunctions.validateEmail(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: Provider.of<FavoriteSetting>(context)
                      .getisObscurePassword(),
                  onChanged: (value) {
                    password = value;
                  },
                  style:
                      TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: S.of(context).password,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: AppColors.formIcon,
                      ),
                      suffixIcon: IconButton(
                        icon:
                            Provider.of<FavoriteSetting>(context, listen: false)
                                    .getisObscurePassword()
                                ? Icon(Icons.remove_red_eye_outlined)
                                : Icon(Icons.remove_red_eye),
                        onPressed: () {
                          Provider.of<FavoriteSetting>(context, listen: false)
                              .changeVisabilityOfPassword();
                        },
                        iconSize: 30,
                        color: AppColors.formIcon,
                      ),
                      labelStyle: TextStyle(fontSize: 15)),
                  validator: (value) {
                    return ValidateFunctions.validatePassword(value);
                  },
                ),
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.submitButton)),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      _formKey.currentState.reset();
                    }
                  },
                  child: Text(S.of(context).submit),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Center(
                  child: InkWell(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: S.of(context).have_an_account,
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.black,
                              fontSize: 15,
                            )),
                        TextSpan(
                            text: S.of(context).sign_in,
                            style: TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ))
                      ]),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(LogIn.id);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
