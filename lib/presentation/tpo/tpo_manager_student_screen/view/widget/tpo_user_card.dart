import 'package:flutter/material.dart';

class TPOStudentCard extends StatelessWidget {
  const TPOStudentCard(
      {super.key,
      required this.fullName,
      required this.phone,
      required this.email,
      required this.username,
      this.onPressed});

  final String fullName;
  final String phone;
  final String email;
  final String username;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Name"), Text("Phone"), Text("Email"), Text("Username")],
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(":$fullName"), Text(":$phone"), Text(":$email"), Text(":$username")],
              )
            ],
          ),
        ),
      ),
    );
  }
}
