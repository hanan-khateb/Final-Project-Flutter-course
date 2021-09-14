import '../models/ValidateFunctions.dart';
import '../screens/SignUp.dart';
import '../generated/l10n.dart';
import '../models/FavoriteSetting.dart';
import '../utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  static const id = "login";
  String email;
  String password;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: Text(S.of(context).log_in),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: Provider.of<FavoriteSetting>(context)
                        .getisObscurePassword(),
                    onSaved: (value) {
                      //  myData.add(value);
                    },
                    onChanged: (value) {
                      password = value;

                      //    LogInValues.changePassword(value);
                    },
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: S.of(context).password,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: AppColors.formIcon,
                        ),
                        suffixIcon: IconButton(
                          icon: Provider.of<FavoriteSetting>(context,
                                      listen: false)
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
                  ),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.submitButton)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _formKey.currentState.reset();
                      }
                    },
                    child: Text(S.of(context).submit),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: TextButton(
                      child: Text(
                        S.of(context).forgot_your_password,
                        textDirection: Provider.of<FavoriteSetting>(context)
                            .textDirectionApp,
                        style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        //  ConfrimeScreen.source = 2;
                        // Navigator.of(context).pushNamed(ConfrimeByEmail.id);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Center(
                    child: GestureDetector(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: S.of(context).do_not_have_an_account,
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Colors.black,
                                fontSize: 15,
                              )),
                          TextSpan(
                              text: S.of(context).sign_up,
                              style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                color: Colors.blueAccent,
                                fontSize: 15,
                              ))
                        ]),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(SignUp.id);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
