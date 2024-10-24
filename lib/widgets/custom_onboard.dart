import 'package:flutter/material.dart';

class CustomOnboarding extends StatelessWidget {
  const CustomOnboarding({super.key, required this.img, required this.title, required this.des});
  final String img;
  final String title;
  final String des;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img,width: 500,height: 500,),
            const SizedBox(height: 10),
            Text(
              title,
              style:const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              des,
              maxLines: 3,
              overflow: TextOverflow.clip,
              style:const TextStyle(fontSize: 19),
            ),
          ]),
    );
  }
}
