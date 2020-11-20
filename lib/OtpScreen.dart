import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apps/SuccessOtpResponse.dart';
import 'package:flutter_apps/SuccessResponse.dart';
import 'package:flutter_apps/UserGeo.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MaterialApp(home: OtpScreen()));

class OtpScreen extends StatefulWidget {
  String verifyId, email, name, pass, phone;

  OtpScreen({this.verifyId, this.email, this.name, this.pass, this.phone});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var entertedpin;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.widget.verifyId),
            Text(this.widget.email),
            Text(this.widget.name),
            Text(this.widget.pass),
            Text(this.widget.phone),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 50,
              fieldStyle: FieldStyle.underline,
              style: TextStyle(fontSize: 17),
              onCompleted: (pin) {
                print("Completed: " + pin);
                entertedpin = pin;
              },
            ),
            FlatButton(
                onPressed: () {
                  verifyotp(this.widget.verifyId, entertedpin);
                },
                child: Text("verify otp"))
          ],
        ),
      ),
    );
  }

  Future<SuccessOtpReposne> verifyotp(String verifyId, entertedpin) async {
    var url = "https://api.kaleyra.io/v1/HXAP1681347554IN/verify/validate";

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'api-key': 'Aa6f3cb86a37f7b7fccfdfc45a0f365da'
    };
    final msg = jsonEncode({"verify_id": verifyId, "otp": entertedpin});
    http.Response response = await http.post(url, headers: headers, body: msg);
    print(response.body);
    SuccessOtpReposne successResponse =
        SuccessOtpReposne.fromJson(json.decode(response.body));
    print(successResponse.data.message);
    if (response.statusCode == 200) {
      var url = "http://43.254.41.228:8082/api/users";

      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'name': this.widget.name,
            'email': this.widget.email,
            'password': this.widget.pass
          }));
      print(response.body);

      UserGeo userGeo = UserGeo.fromJson(json.decode(response.body));
      print(userGeo.name);
      print(userGeo.email);
      print(userGeo.id);
    }
  }
}
