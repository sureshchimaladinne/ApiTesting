import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'hosptal_model.dart';

class Hosptalview extends StatefulWidget {
  const Hosptalview({Key? key}) : super(key: key);

  @override
  State<Hosptalview> createState() => _HosptalviewState();
}

class _HosptalviewState extends State<Hosptalview> {
  GetTheValue? Hosptal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
            itemCount: Hosptal?.hospitalTypesR?.length ?? 0,
            itemBuilder: (BuildContext context, index) {
              final HosptalObj = Hosptal?.hospitalTypesR![index];
              return Card(
                child: Column(
                  children: [
                    Text(HosptalObj?.lattitude??""),
                     Text(HosptalObj?.longitude ?? ""),
                      Text(HosptalObj?.hospitalid ?? ""),
                       Text(HosptalObj?.hospitalname ?? ""),
                        Text(HosptalObj?.address ?? ""),
                         Text(HosptalObj?.statename ?? ""),
                          Text(HosptalObj?.district ?? ""),
                           Text(HosptalObj?.mandal ?? ""),
                            Text(HosptalObj?.city ?? ""),
                             Text(HosptalObj?.categeory ?? ""),
                    ],
                ),
              );
            }
            ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HosptalGetValue();
  }

  HosptalGetValue() async {
    final postUrl =
        "https://citizen.uat.jaesmp.com/hospital/getHospitalsListRev";
    final dioObject = Dio();
    final HosptalBody = {
      "lattitude": "23.26466",
      "longitude": "77.40521",
      "radius": "10000",
      "category": "1",
      "chiefComplantId": "0"
    };

    Response responsedata = await dioObject.post(postUrl, data: HosptalBody);
    print("data ${responsedata.data}");
    final HosptalData = GetTheValue.formjson(responsedata.data);
    setState(() {
      print(HosptalData.hospitalTypesR);
      Hosptal = HosptalData;
    });
  }
}
