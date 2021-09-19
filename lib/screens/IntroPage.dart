import 'package:depression_treatment/screens/WelcomePage.dart';

import '../models/FavoriteSetting.dart';
import '../generated/l10n.dart';
import '../utils/AppColors.dart';
import '../utils/FontsStyle.dart';
import '../weidgets/IntroContent.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroPage extends StatefulWidget {
  static const id = "intro";

  @override
  _IntroPageState createState() => _IntroPageState();
}

enum languages { Arabic, English }

class _IntroPageState extends State<IntroPage> {
  var controller = PageController();

  _animateToIndex(i) =>
      controller.animateTo(MediaQuery.of(context).size.width * i,
          duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);

  @override
  Widget build(BuildContext context) {
    var _selection = null;
    final pages = [
      IntroContent(
        imageName: "50",
        welcomeNumber: 1,
      ),
      IntroContent(
        imageName: "56",
        welcomeNumber: 2,
      ),
      IntroContent(
        imageName: "53",
        welcomeNumber: 3,
      ),
      IntroContent(
        imageName: "54",
        welcomeNumber: 4,
      ),
      IntroContent(
        imageName: "51",
        welcomeNumber: 5,
      ),
      IntroContent(
        imageName: "55",
        welcomeNumber: 6,
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: PopupMenuButton<languages>(
          onSelected: (languages result) {
            setState(() {
              _selection = result;
              Provider.of<FavoriteSetting>(context, listen: false)
                  .changeLanguage(result.toString().split(".")[1]);
            });
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<languages>>[
            PopupMenuItem<languages>(
              value: languages.English,
              child: Text(S.of(context).English),
            ),
            PopupMenuItem<languages>(
              value: languages.Arabic,
              child: Text(S.of(context).Arabic),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          S.of(context).mental_health,
          style: FontsStyle.appBarStyle,
        ),
        backgroundColor: AppColors.appBarColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 230,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages[index];
              },
            ),
          ),
          SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: WormEffect() // ExpandingDotsEffect()
              /* ScrollingDotsEffect()*/
              ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    _animateToIndex(controller.page - 1);
                  },
                  child: Text(
                    S.of(context).previous,
                    style: FontsStyle.introAction,
                  )),
              TextButton(
                  onPressed: () {
                    _animateToIndex(controller.page + 1);
                  },
                  child: Text(
                    S.of(context).next,
                    style: FontsStyle.introAction,
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back,
                  color: AppColors.introText,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(WelcomePage.id);
                    },
                    child: Text(
                      S.of(context).skip,
                      style: FontsStyle.introAction,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
