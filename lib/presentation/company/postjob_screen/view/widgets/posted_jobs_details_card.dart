import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostedJobsDetailsCard extends StatelessWidget {
  const PostedJobsDetailsCard(
      {super.key,
      required this.size,
      required this.companyName,
      required this.jobTitle,
      required this.description,
      required this.requirement,
      required this.salary,
      required this.lastDate});

  final Size size;
  final String? companyName;
  final String? jobTitle;
  final String? description;
  final String? requirement;
  final String? salary;
  final String? lastDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * .4,
      width: size.width * .9,
      padding: EdgeInsets.only(left: 10, top: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Company'),
                      Text('Job title'),
                      Text('Description'),
                      Text('Requirement'),
                      Text('Salary'),
                      Text('Last date'),
                    ],
                  ),
                  SizedBox(width: 5),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(':$companyName'),
                        Text(':$jobTitle'),
                        Text(':$description',overflow: TextOverflow.ellipsis),
                        Text(':$requirement'),
                        Text(':$salary'),
                        Text(':$lastDate'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
