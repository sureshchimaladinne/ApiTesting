import'package:api_testing/model/api_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class Apilist extends StatefulWidget {
  const Apilist({Key? key}) : super(key: key);
  @override
  State<Apilist> createState() => _ApilistState();
}

class _ApilistState extends State<Apilist> {
  List<UesrDetails>? userdetail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: userdetail?.length ?? 0,
          itemBuilder: (BuildContext context, index) {
            final userobj = userdetail?[index];
            return Card(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(userobj?.avatar ?? ""),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text("${userobj?.id ?? ""}"),
                                Text(
                                    userobj?.email ?? ""
                                ),
                                Text(userobj?.firstname ?? ""),
                                Text(userobj?.lastnaame ?? ""),
                              ],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiListView();
  }

  ApiListView() async {
    final json = "https://reqres.in/api/users?page=2";
    final dioObject = Dio();
    Response responseName = await dioObject.get(json);
    // print("userdetail ${responseName.data}");
    final output = UserInfo.formjson(responseName.data);
    setState(() {
      this.userdetail = output.data;
    });
  }
}