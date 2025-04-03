import 'package:flutter/material.dart';

import 'XNetworkImage.dart';

class CircularProfilePic  extends StatelessWidget {
  double? radius;
  CircularProfilePic ({super.key, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: ClipOval(
          child: XNetworkImage(
            url: "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
            fit: BoxFit.cover,
            width: 1000,
            height: 1000,
          )
      ),
    );
  }
}
