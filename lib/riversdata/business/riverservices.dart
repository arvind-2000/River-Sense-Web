import 'dart:async';
import 'dart:convert';
import '../models/riverdetailsentity.dart';
import '../models/riverentities.dart';
import 'package:http/http.dart' as http;

class RiverService {
  int responsecode = 0;

  Future<List<RiverDetails>> getdata(List<String> api) async {
    List<RiverDetails> datas = [];
    RiverDetails riverdata = RiverDetails(id: '', name: '', river: []);
    for (String i in api) {
      await http.get(Uri.parse(i)).then((value) {
        print('in service response');
        if (value.statusCode == 200) {
          // print('okay in service');
          var data = jsonDecode(value.body) as Map<String, dynamic>;
          print("${data['channel']['name']} ${data['feeds'].length}");
          riverdata = convertValues(
              data['feeds'], data['channel']['name'], data['channel']['id']);
          responsecode = 1;
        } else {
          if (value.statusCode == 500) {
            print('server error');
            responsecode = 2;
          } else {
            print('client error');
            responsecode = 3;
          }
        }
        if (!riverdata.river.isEmpty) {
          datas.add(riverdata);
        }
      });
    }
    return  datas;
  }

  RiverDetails convertValues(List<dynamic> data, name, channelid) {
    List<River> tempdata = [];

    try {
      for (var d in data) {
        // print(' $channelid  $name');
        River value = River(
            id: d["id"].toString(),
            channelid: channelid,
            name: name,
            usv: d["field2"],
            hv: d["field4"],
            tv: d["field3"],
            date: DateTime.parse(d["created"]));
        tempdata.add(value);
      }
    } catch (e) {
      print('$e');
    }
    RiverDetails rivers =
        RiverDetails(id: channelid, name: name, river: tempdata);
    return rivers;
  }

  bool floodIndicator(double value, thresh) {
    if (value >= thresh) {
      return true;
    }
    return false;
  }

  List<double> datapoints(RiverDetails d) {
    List<double> _data = [];

    for (River x in d.river) {
      double val = 0.0;
      try {
        val = double.parse(x.hv);
      } catch (e) {
        val = 0.0;
      }
      _data.add(val);
    }
    print("${d.name}:${_data.length}");
    return [..._data];
  }
}
