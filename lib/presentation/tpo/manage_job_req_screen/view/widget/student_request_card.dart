import 'package:flutter/material.dart';

class StudentRequestCard extends StatelessWidget {
  const StudentRequestCard({super.key, required this.size, required this.name, required this.jobApplied, required this.status, required this.dateTime});

  final Size size;
  final String name;
  final String jobApplied;
  final String status;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: size.width * .07, right: size.width * .07, bottom: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Name"), Text("Job Applied"), Text("Status"), Text("Applied Date")],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(":$name"), Text(":$jobApplied"), Text(":$status"), Text(":$dateTime")],
              )
            ],
          ),
        ),
      ),
    );
  }
}
