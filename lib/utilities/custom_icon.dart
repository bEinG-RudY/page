import 'package:flutter/material.dart';

Container customContainer(
    {required double sw, required IconData icon, required var text}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: BorderRadius.circular(15)),
    height: 70,
    width: sw,
    child: Row(children: [
      Icon(
        icon,
        color: Colors.blueAccent,
      ),
      const SizedBox(
        width: 15,
      ),
      Text(
        "${text}",
        style: const TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 17),
      )
    ]),
  );
}
