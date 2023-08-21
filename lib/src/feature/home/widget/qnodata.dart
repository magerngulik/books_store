import 'package:flutter/material.dart';

class QNodata extends StatelessWidget {
  const QNodata({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              height: 160.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icon/nf.png"),
                  fit: BoxFit.fitHeight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Data yang anda cari belum tersedia",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
