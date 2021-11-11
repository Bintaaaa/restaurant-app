import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/color.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/style/text_style.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _background() {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/get.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget _modal() {
      return Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: defaultMargin),
            width: MediaQuery.of(context).size.width * 0.89,
            height: MediaQuery.of(context).size.height * 0.38,
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Restaurant\nInstagramable",
                    style: myTexTheme.headline5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Start your day with a cup of coffee and\na plate of traffles at your favorite\nrestaurant.",
                    style: myTexTheme.caption!.copyWith(color: greyColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  ElevatedButton(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: myTexTheme.headline6,
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(softGreenColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [_background(), _modal()],
      ),
    );
  }
}
