import 'dart:convert';

import 'package:covid_tracker/Models/Model1.dart';
import 'package:covid_tracker/View/countries.dart';
import 'package:covid_tracker/services/Utilities/app_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;

//Here there are two methods to retrieve data from Online API
// Here i have used easy method
// Down I have commented  the Future Builder method as well which is complex and needs creating models

// class Worldstats extends StatefulWidget {
//   const Worldstats({Key? key}) : super(key: key);

//   @override
//   State<Worldstats> createState() => _WorldstatsState();
// }

// class _WorldstatsState extends State<Worldstats> with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     getapidata();
//     setState(() {});
//   }

//   // ignore: prefer_typing_uninitialized_variables
//   var jsonResponse;
//   late final AnimationController _controller =
//       AnimationController(duration: const Duration(seconds: 3), vsync: this)
//         ..repeat();

//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }

//   Future getapidata() async {
//     var response = await http.get(Uri.parse(AppUrl.worldStateApi));

//     if (response.statusCode == 200) {
//       jsonResponse = jsonDecode(response.body);

//       setState(() {});
//     } else {
//       throw Exception('error');
//     }
//   }

//   final colorList = <Color>[
//     const Color(0xff4285F4),
//     const Color(0xff1aa260),
//     const Color(0xffde5246)
//   ];

//   @override
//   Widget build(BuildContext context) {
//     setState(() {});

//     return Scaffold(
//         body: jsonResponse == null
//             ? Center(
//                 child: SpinKitFadingCircle(
//                   color: Colors.white,
//                   size: 50,
//                   controller: _controller,
//                 ),
//               )
//             : Column(
//                 children: [
//                   PieChart(
//                     dataMap: {
//                       'Total': jsonResponse['cases'],
//                       "Recovered": jsonResponse['recovered'],
//                       "Deaths": jsonResponse['deaths']
//                     },
//                     chartRadius: MediaQuery.of(context).size.width / 3.2,
//                     legendOptions: const LegendOptions(
//                         legendPosition: LegendPosition.left),
//                     animationDuration: const Duration(seconds: 3),
//                     chartType: ChartType.ring,
//                     colorList: colorList,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         vertical: MediaQuery.of(context).size.height * .06),
//                     child: Card(
//                       child: Column(
//                         children: [
//                           ReusableRow(title: 'Total', value: '200'),
//                           ReusableRow(title: 'Total', value: '200'),
//                           ReusableRow(title: 'Total', value: '200'),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                         color: const Color(0xff1aa260),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: const Center(child: Text('Track Countries')),
//                   )
//                 ],
//               ));
//   }
// }

// // ignore: must_be_immutable
class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}

class WorldTotalStats extends StatefulWidget {
  const WorldTotalStats({Key? key}) : super(key: key);

  @override
  State<WorldTotalStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldTotalStats>
    with TickerProviderStateMixin {
  @override
  Future<WorldStats> getstats() async {
    var response = await http.get(Uri.parse(AppUrl.worldStateApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStats.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder(
              future: getstats(),
              builder:
                  (BuildContext context, AsyncSnapshot<WorldStats> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      ReusableRow(
                          title: 'Total',
                          value: snapshot.data!.todayCases!.toString()),
                      ReusableRow(
                          title: 'Deaths',
                          value: snapshot.data!.deaths!.toString()),
                      ReusableRow(
                          title: 'Recovered',
                          value: snapshot.data!.recovered!.toString()),
                      ReusableRow(
                          title: 'Active',
                          value: snapshot.data!.active!.toString()),
                      ReusableRow(
                          title: 'Today Cases',
                          value: snapshot.data!.todayCases!.toString()),
                      ReusableRow(
                          title: 'Today Deaths',
                          value: snapshot.data!.todayDeaths!.toString()),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Countries())),
                        child: Container(
                          height: 50,
                          width: 200,
                          color: Colors.green,
                          child:
                              const Center(child: Text("Track Country Wise")),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("Loading"),
                  );
                }
              })),
    ));
  }
}
