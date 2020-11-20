import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_apps/Chars.dart';
import 'package:flutter_apps/GenerateOtp.dart';
import 'package:flutter_apps/OtpScreen.dart';
import 'package:flutter_apps/SuccessResponse.dart';
import 'package:flutter_apps/UserGeo.dart';
import 'package:http/http.dart' as http;
import 'GeneratedOtps.dart' as gtp;

void main() => runApp(new MaterialApp(
      home: Signup(),
    ));

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailcontroller = TextEditingController();
  final _namecontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                  labelText: "enter email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                  labelText: "enter name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passcontroller,
              decoration: InputDecoration(
                  labelText: "enter password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _phonecontroller,
              decoration: InputDecoration(
                  labelText: "enter phone number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {
                generateotp(
                    _emailcontroller.text.toString(),
                    _namecontroller.text.toString(),
                    _passcontroller.text.toString(),
                    _phonecontroller.text.toString());
                var mobile = "+91" + "8296159595";
                print(mobile);

                /*    register(
                    _emailcontroller.text.toString(),
                    _namecontroller.text.toString(),
                    _passcontroller.text.toString());*/
              },
              child: Text("Register"),
              color: Colors.black87,
              textColor: Colors.white,
              splashColor: Colors.amber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {
                Navigator.push(context,
                    (MaterialPageRoute(builder: (context) => Chars())));
              },
              child: Text("Go to Charts page"),
              color: Colors.black87,
              textColor: Colors.white,
              splashColor: Colors.amber,
            ),
          )
        ],
      ),
    );
  }

  void register(String string, String string2, String string3) async {
    var url = "http://43.254.41.228:8082/api/users";

    http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': string2,
          'email': string,
          'password': string3
        }));
    print(response.body);

    UserGeo userGeo = UserGeo.fromJson(json.decode(response.body));
    print(userGeo.name);
    print(userGeo.email);
    print(userGeo.id);
  }

  Future<SuccessResponse> generateotp(
      String string, String string2, String string3, String string4) async {
    var url = "https://api.kaleyra.io/v1/HXAP1681347554IN/verify";
    var mobile = "+918296159595";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'api-key': 'Aa6f3cb86a37f7b7fccfdfc45a0f365da'
    };

    final msg = jsonEncode({
      "flow_id": "35c5092b-b9e0-409c-b0c6-097b01d6bdf8",
      "to": {"mobile": mobile, "email": "geolaps20@gmail.com"}
    });

    http.Response response = await http.post(url, headers: headers, body: msg);
    print(response.body);
    print(json.decode(response.body));
    SuccessResponse successResponse =
        SuccessResponse.fromJson(json.decode(response.body));
    var verifyid = successResponse.data.verifyId;
    print(successResponse.data.verifyId);

    Navigator.push(
        context,
        (MaterialPageRoute(
            builder: (context) => OtpScreen(
                  verifyId: verifyid,
                  email: _emailcontroller.text.toString(),
                  name: _namecontroller.text.toString(),
                  pass: _passcontroller.text.toString(),
                  phone: mobile,
                ))));
  }
}
