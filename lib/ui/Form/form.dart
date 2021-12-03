import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:helpus/Entity/language.dart';
import 'package:helpus/services/size_config.dart';
import 'package:helpus/ui/home_page.dart';
import 'package:helpus/utils/localization/language_constants.dart';
import 'package:helpus/utils/localization/localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    Key key,
  }) : super(key: key);

  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
    await AppLocalizations.load(_locale);
    setState(() {});
  }

  bool rememberMe = false;
  // this bool will check rememberMe is checked
  bool showErrorMessage = false;
  String errorMessageText = '';
  bool isLoadingF = false;
  bool isLoadingG = false;

  @override
  void initState() {
    super.initState();
  }

  showLoadDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(backgroundColor: Colors.transparent, content: null);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List<Widget>.generate(
                            Language.languageList().length,
                            (index) => Container(
                                  width: SizeConfig.screenWidth / 2,
                                  margin: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 3),
                                  child: MaterialButton(
                                    minWidth: 0,
                                    elevation: 12,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                    ),
                                    color: Colors.white,
                                    onPressed: () {
                                      _changeLanguage(Language.languageList().elementAt(index));
                                      setState(() {});
                                    },

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          Language.languageList().elementAt(index).flag,
                                          style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 8.5),
                                        ),
                                        Text(Language.languageList().elementAt(index).name)
                                      ],
                                    ),
                                  ),
                                ))),
                  ),
                  Text(
                    (AppLocalizations.currentLangageCode != "us") ? AppLocalizations.of(context).hello : "Hey",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.largeText2,
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenWidth / 1.5,
                    margin: EdgeInsets.only(bottom: SizeConfig.safeBlockHorizontal * 3),
                    child: MaterialButton(
                      minWidth: 0,
                      elevation: 12,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        //side: BorderSide(color: activebuttoncolor, width: SizeConfig.safeBlockHorizontal)
                      ),
                      //padding: EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 3, horizontal: 12),
                      color: Colors.amber,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (
                            context,
                          ) =>
                                  HomePage()),
                        );
                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context).next,
                            style: TextStyle(fontSize: SizeConfig.mediumText2, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
