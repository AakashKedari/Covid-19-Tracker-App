import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  String image;
  String name;
  int totalCases, totalDeaths;

  Details(
      {required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.orange),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.image),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Text("Total Cases"),
            trailing: Text(widget.totalCases.toString()),
          ),
          ListTile(
            leading: const Text("Total Deaths"),
            trailing: Text(widget.totalDeaths.toString()),
          )
        ],
      )),
    );
  }
}
