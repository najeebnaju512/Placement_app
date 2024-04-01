import 'package:flutter/material.dart';

import '../../../../../core/constants/color_constants.dart';

class ApplyJobsCard extends StatelessWidget {
  const ApplyJobsCard({
    super.key,
    required this.size,
    required this.position,
    required this.description,
    required this.location,
    required this.salary,
    this.requirement,
    required this.deadLine,
    required this.onPressed,
  });

  final Size size;
  final String? position;
  final String? description;
  final String? location;
  final String? salary;
  final String? requirement;
  final String? deadLine;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .34,
      width: size.width * .9,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(left: size.width * .03, right: size.width * .03),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$position',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                '$description',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '$requirement',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 5),
              Text(
                '$location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 5),
              Text(
                'Salary: $salary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              ),
              Text(
                'Last Date:$deadLine',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w200),
              ),
              SizedBox(height: 5),
              SizedBox(height: 10),
              Center(
                child: MaterialButton(
                  color: ColorTheme.primary,
                  child: Text(
                    "APPLY NOW",
                    style: TextStyle(color: ColorTheme.white, fontWeight: FontWeight.bold),
                  ),
                  height: size.height * .06,
                  onPressed: () => onPressed,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
