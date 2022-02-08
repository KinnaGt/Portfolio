import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: const Color(0xFF141414),
        child: Column(
          children: [
            const Spacer(flex: 2),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/mipic.jpeg"),
            ),
            const Spacer(),
            Text(
              "Iñaki Lapeyre",
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const Text(
              " Mobile Developer ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w200,
                height: 1.5,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
