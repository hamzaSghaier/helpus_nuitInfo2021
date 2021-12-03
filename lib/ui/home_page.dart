import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:helpus/Entity/language.dart';
import 'package:helpus/services/size_config.dart';
import 'package:helpus/utils/localization/language_constants.dart';
import 'package:helpus/utils/localization/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:helpus/Entity/language.dart';
import 'package:helpus/services/size_config.dart';
import 'package:helpus/ui/home_page.dart';
import 'package:helpus/utils/localization/language_constants.dart';
import 'package:helpus/utils/localization/localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
    await AppLocalizations.load(_locale);
    DateFormat formatter = DateFormat('yyyy-MM-dd');

    setState(() {
      dateFormatted = formatter.format(now);
    });
    setState(() {});
  }

  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String dateFormatted;

  @override
  void initState() {
    super.initState();
    dateFormatted = formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
              Text("$dateFormatted"),
              DropdownButton<Language>(
                //dropdownColor: Colors.transparent,
                elevation: 8,
                underline: Container(),
                icon: Icon(
                  Icons.language,
                  color: Colors.black,
                  size: SizeConfig.safeBlockHorizontal * 7,
                ),
                onChanged: (Language language) {
                  _changeLanguage(language);
                  setState(() {});
                },
                items: Language.languageList()
                    .map<DropdownMenuItem<Language>>(
                      (e) => DropdownMenuItem<Language>(
                        value: e,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              e.flag,
                              style: TextStyle(fontSize: SizeConfig.blockSizeHorizontal * 8.5),
                            ),
                            Text(e.name)
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ]),
            Don()
            // Expanded(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.stretch,
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: <Widget>[
            //       Text(
            //         AppLocalizations.of(context).hello,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: SizeConfig.largeText2,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class Don extends StatefulWidget {
  const Don({key}) : super(key: key);

  @override
  _DonState createState() => _DonState();
}

class _DonState extends State<Don> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String currency() {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
    print("CURRENCY NAME ${format.currencyName}"); // USD
    if (format.currencyName == "EGP") return "دينار";
    return format.currencySymbol;
  }

  String getFormatterNumber(int number) {
    Locale locale = Localizations.localeOf(context);
    final formatterNumber = NumberFormat.decimalPattern(locale.toString());

    return formatterNumber.format(number).toString();
  }

  int selectDon = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      //scrollDirection: Axis.vertical,
      children: [
        Center(
            child: Text(
          '${AppLocalizations.of(context).title}',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30.sp,
          ),
        )),
        SizedBox(
          height: 20.h,
        ),
        Text(AppLocalizations.of(context).mydonation, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.sp)),
        SizedBox(
          height: 20.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectDon = 1;
                    });
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: Card(
                      elevation: 5,
                      color: selectDon == 1 ? Colors.blueAccent : Colors.white,
                      child: Center(
                          child: Text(
                        "${AppLocalizations.of(context).therteen}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: SizeConfig.mediumText2,
                        ),
                      )),
                    ),
                  ),
                ),
                Center(child: Text('${AppLocalizations.of(context).therteen} ${currency()} ${AppLocalizations.of(context).oneHourBoat}'))
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectDon = 2;
                    });
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: Card(
                      elevation: 5,
                      color: selectDon == 2 ? Colors.blueAccent : Colors.white,
                      child: Center(
                          child: Text('${AppLocalizations.of(context).fifteen}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.mediumText2,
                              ))),
                    ),
                  ),
                ),
                Center(child: Text('${AppLocalizations.of(context).twoJacket}'))
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectDon = 3;
                    });
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: Card(
                      elevation: 5,
                      color: selectDon == 3 ? Colors.blueAccent : Colors.white,
                      child: Center(
                          child: Text('${AppLocalizations.of(context).oneHundred}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.mediumText2,
                              ))),
                    ),
                  ),
                ),
                Center(child: Text('${AppLocalizations.of(context).oneDayyOfSupport}'))
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectDon = 4;
                    });
                  },
                  child: Container(
                    width: 50.w,
                    height: 50.h,
                    child: Card(
                      elevation: 5,
                      color: selectDon == 4 ? Colors.blueAccent : Colors.white,
                      child: Center(
                          child: Text('${AppLocalizations.of(context).oneHundredtwentyfour}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: SizeConfig.mediumText2,
                              ))),
                    ),
                  ),
                ),
                Center(child: Text('${AppLocalizations.of(context).resecureKit}'))
              ],
            )
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Center(
          child: Text(
            '${AppLocalizations.of(context).home_label}',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.sp),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.w, right: 50.w, top: 22.h, bottom: 20.h),
          child: TextField(
            decoration: new InputDecoration(
              labelText: currency(),
              labelStyle: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Text('${AppLocalizations.of(context).theseequivalance}'),
        Text('${AppLocalizations.of(context).mycontact}', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.sp)),
        new Form(
          key: _formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                  keyboardType: TextInputType.emailAddress, // Use email input type for emails.
                  decoration: new InputDecoration(hintText: ' ', labelText: '${AppLocalizations.of(context).emailAdresse}')),
              new TextFormField(
                  obscureText: true, // Use secure text for passwords.
                  decoration: new InputDecoration(
                    hintText: '${AppLocalizations.of(context).lastName}',
                  )),
              new TextFormField(
                  obscureText: true, // Use secure text for passwords.
                  decoration: new InputDecoration(
                    hintText: '${AppLocalizations.of(context).firsrName}',
                  )),
              CiviliteDropDownButton(),
              new Container(
                width: 100.w,
                child: new RaisedButton(
                  child: new Text(
                    '${AppLocalizations.of(context).toValidate}',
                    style: new TextStyle(color: Colors.white),
                  ),
                  onPressed: () => null,
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              )
            ],
          ),
        )
      ],
    );
  }
}

class CiviliteDropDownButton extends StatefulWidget {
  const CiviliteDropDownButton({key}) : super(key: key);
  @override
  State<CiviliteDropDownButton> createState() => _CiviliteDropDownButtonState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CiviliteDropDownButtonState extends State<CiviliteDropDownButton> {
  String _country = "FR";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            //margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              "${AppLocalizations.of(context).profile_label}",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: SizeConfig.smallText2),
            ),
          ),
        ),
        Flexible(
          child: Container(
            // padding: EdgeInsets.only(top:10, bottom: 10),
            // color: Colors.red,
            // width: SizeConfig.safeBlockHorizontal * 60,
            child: CountryCodePicker(
              textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: SizeConfig.smallText2),
              onChanged: (CountryCode countryCode) {
                //TODO : manipulate the selected country code here
              },
              // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
              initialSelection: _country,
              favorite: ['PT', 'GB', 'FR', 'IT', 'ES', 'US', 'DE'],
              // optional. Shows only country name and flag
              showCountryOnly: true,
              // optional. Shows only country name and flag when popup is closed.
              showOnlyCountryWhenClosed: true,
              // optional. aligns the flag and the Text left
              alignLeft: false,
            ),
          ),
        )
      ],
    );
  }
}
