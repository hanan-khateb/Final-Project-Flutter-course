import 'package:depression_treatment/models/FavoriteSetting.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../utils/AppColors.dart';
import '../utils/FontsStyle.dart';
import '../weidgets/MyDrawer.dart';
import 'InterviewTab.dart';
import 'MainTab.dart';
import '../screens/ProfileTab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const id = "home";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: new Scaffold(
          drawer: Provider.of<FavoriteSetting>(context).language == "Arabic"
              ? MyDrawer()
              : null,
          endDrawer: Provider.of<FavoriteSetting>(context).language == "English"
              ? MyDrawer()
              : null,
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            title: Text(
              S.of(context).mental_health,
              style: FontsStyle.appBarStyle,
            ),
            //automaticallyImplyLeading: false,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Container(
                  height: 70,
                  color: Colors.blue[900],
                  child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey[500],
                      indicatorColor: Colors.white,
                      tabs: <Widget>[
                        Tab(icon: Icon(Icons.home, size: 35)),
                        Tab(
                            icon:
                                Icon(Icons.account_circle_outlined, size: 35)),
                        Tab(icon: Icon(Icons.video_call_outlined, size: 35))
                      ])),
            ),
          ),
          body: TabBarView(
            children: <Widget>[MainTab(), ProfileTab(), InterviewTab()],
          ),
        ));
  }
}
