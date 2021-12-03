import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpus/services/size_config.dart';
import 'package:helpus/utils/localization/localizations.dart';

import 'imports.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key key,
  }) : super(key: key);

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
        onWillPop: () async {
          // ignore: missing_return
          if (Navigator.canPop(context)) {
            print("yes it pop");
            Navigator.of(context).pop(false);
          } else {
            print("no you con't pop");
            final value = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: Container(
                      height: SizeConfig.safeBlockHorizontal * 20,
                      width: SizeConfig.safeBlockHorizontal * 26,
                      child: Text(AppLocalizations.of(context).confirm_exit_app_dialog,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.smallText1)),
                    ),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text(AppLocalizations.of(context).no_exit_label,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.smallText1)),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text(AppLocalizations.of(context).yes_exit_label,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: SizeConfig.smallText1)),
                        onPressed: () {
                          SystemNavigator.pop();
                        },
                      ),
                    ],
                  );
                });

            return value == true;
          }
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0), // here the desired height
            child: AppBar(
              title: Text(" "),
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0.0,
            ),
          ),
          body: LoginForm(),
        ));
  }

  @override
  void dispose() {
    //_loginBloc.dispose();
    super.dispose();
  }
}
