import 'package:flutter/material.dart';

class StudentApplicationCard extends StatelessWidget {
  const StudentApplicationCard(
      {super.key,
      required this.name,
      required this.date,
      required this.status});

  final String? name;
  final String? date;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name"),
                Text("Date"),
                Text(
                  "Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(":$name"),
                Text(":$date", overflow: TextOverflow.ellipsis),
                Text(
                  ":$status",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
