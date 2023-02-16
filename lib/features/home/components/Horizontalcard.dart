import 'package:flutter/material.dart';

import '../../../components/button.dart';

class HorizontalCardHome extends StatelessWidget {
  const HorizontalCardHome({
    super.key,
    required this.title,
    required this.horas,
    required this.city,
    required this.decoration,
  });
  final String title;
  final String horas;
  final String city;
  final BoxDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0, right: 0, top: 3, bottom: 0),
      child: SizedBox(
        width: 190,
        height: 230,
        child: Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: decoration,
                ),
              ),
              Container(
                height: 90,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 5.0, right: 0, top: 5, bottom: 0),
                  child: SizedBox(
                    width: 180,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 25,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.timelapse),
                            SizedBox(
                              width: 120,
                              height: 25,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    horas,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            SizedBox(
                              width: 130,
                              height: 24,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    city,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              button(
                  width: 140,
                  heigth: 35,
                  color: Colors.red,
                  text: Text("Assista Ao Vivo"),
                  onPressed: () {/* ... */},
                  foregroundColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
