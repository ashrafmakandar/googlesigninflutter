import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_apps/Cdata.dart';
import 'package:flutter_apps/Click.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(new MaterialApp(
      home: Chars(),
    ));

class Chars extends StatefulWidget {
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Chars> {
  List<Cdata> a;
  var data;
  var series;
  var chart;
  var chartWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    series = [
      new charts.Series(
          id: 'click',
          data: data,
          domainFn: (Click clickData, _) => clickData.deviceid,
          measureFn: (Click clickData, _) => clickData.batterylevel,
          colorFn: (Click clickData, _) => clickData.barColor)
    ];
    chart = new charts.BarChart(
      series,
      animate: true,
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.black87,
            child: SizedBox(
              height: 200.0,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Cdata>> getdata() async {
    var url =
        "http://43.254.41.228:8082/api/reports/route?_dc=1605761990416&deviceId=2&type=allEvents&from=2020-10-31T18%3A30%3A00.000Z&to=2020-11-30T18%3A30%3A00.000Z&page=1&start=0&limit=25";
    http.Response response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: "eWFkaHVyYWptOkRpbmVzaEAxMjNkZA=="
      },
    );
    print(response.body);
    setState(() {
      a = List<Cdata>.from(
          json.decode(response.body).map((x) => Cdata.fromJson(x)));

      for (int i = 0; i < a.length; i++) {
        data = [
          new Click(a[i].attributes.batteryLevel, a[i].deviceId,
              charts.ColorUtil.fromDartColor(Colors.blue))
        ];

      }
    });
    return a;
  }
}
