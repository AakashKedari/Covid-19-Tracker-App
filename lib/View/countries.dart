import 'dart:convert';

import 'package:covid_tracker/View/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:covid_tracker/services/Utilities/app_url.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  @override
  void initState() {
    super.initState();
    setState(() {});
    getcountrydata();
  }

  var jsonResponse = [];

  Future getcountrydata() async {
    var response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
      setState(() {
        jsonResponse = jsonDecode(response.body);
      });
    } else {
      throw Exception('Error');
    }
  }

  Widget build(BuildContext context) {
    setState(() {});
    if (jsonResponse.isEmpty) {
      return Scaffold(body: Center(child: Text("Loading")));
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            centerTitle: true,
            title: const Text(
              "Countries and Deaths",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),
            ),
          ),
          body: SafeArea(
            child: ListView.builder(
                itemCount: jsonResponse.length,
                itemBuilder: (context, index) {
                  if (jsonResponse.isEmpty) {
                    return const Center(
                      child: Text("Null"),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                    name: jsonResponse[index]["country"],
                                    image: jsonResponse[index]["countryInfo"]
                                        ["flag"],
                                    totalCases: jsonResponse[index]['cases'],
                                    totalDeaths: jsonResponse[index]
                                        ['deaths'])));
                      },
                      child: ListTile(
                        tileColor: Colors.black38,
                        title: Text(jsonResponse[index]["country"].toString()),
                        leading: Container(
                            height: 20,
                            width: 40,
                            child: Image.network(
                                jsonResponse[index]["countryInfo"]["flag"])),
                        trailing:
                            Text((jsonResponse[index]['deaths'].toString())),
                      ),
                    );
                  }
                }),
          ),
        ),
      );
    }
  }
}
