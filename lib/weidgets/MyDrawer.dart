import 'package:depression_treatment/TestConn.dart';

import '../screens/LogIn.dart';
import '../screens/SignUp.dart';
import '../utils/AppColors.dart';
import '../generated/l10n.dart';
import '../models/FavoriteSetting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.40,
              child: DrawerHeader(
                child: Text(""),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/16.png'), fit: BoxFit.fill),
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.account_box,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).sign_up),
                onTap: () {
                  Navigator.of(context).pushNamed(SignUp.id);
                }),
            ListTile(
                leading: Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).aboutApp),
                onTap: () {}),
            ListTile(
                leading: Icon(
                  Icons.insert_drive_file_outlined,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).using),
                onTap: () {}),
            ListTile(
                leading: Icon(
                  Icons.headset_mic_outlined,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).callingCenter),
                onTap: () {}),
            ListTile(
                leading: Icon(
                  Icons.login,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).log_in),
                onTap: () {
                  Navigator.of(context).pushNamed(LogIn.id);
                }),
            ListTile(
                leading: Icon(
                  Icons.vpn_key_outlined,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).change_password),
                onTap: () {
                  Navigator.of(context).pushNamed(TestConn.id);
                }),
            ListTile(
                leading: Icon(
                  Icons.language_rounded,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).Language),
                onTap: () {
                  Provider.of<FavoriteSetting>(context, listen: false)
                      .showLanguages();
                }),
            SizedBox(
              height: Provider.of<FavoriteSetting>(context).isShowLanguageList
                  ? 60
                  : 0,
              child: DropdownButton(
                underline: Text(""),
                isExpanded: true,
                value: Provider.of<FavoriteSetting>(context).language,
                items: Provider.of<FavoriteSetting>(context).languages.map((e) {
                  return DropdownMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(e),
                    ),
                    value: e,
                  );
                }).toList(),
                onChanged: (newValue) {
                  Provider.of<FavoriteSetting>(context, listen: false)
                      .changeLanguage(newValue);
                  Provider.of<FavoriteSetting>(context, listen: false)
                      .showLanguages();
                },
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.logout,
                  color: AppColors.draweIcons,
                ),
                title: Text(S.of(context).logout),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
