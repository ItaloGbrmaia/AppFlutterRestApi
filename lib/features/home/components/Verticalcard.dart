import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../components/button.dart';

class CardHome extends StatelessWidget {
  const CardHome({
    super.key,
    required this.title,
    required this.horas,
    required this.city,
  });
  final String title;
  final String horas;
  final String city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 5, bottom: 15),
      child: SizedBox(
        width: 480,
        height: 190,
        child: Card(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 2, right: 10, left: 10, bottom: 14),
                        child: Container(
                          color: Colors.black,
                          child: const Icon(
                            Icons.calendar_month,
                            size: 68,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: 220,
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 220,
                                    height: 26,
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
                                    width: 180,
                                    height: 26,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          horas,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                                    width: 180,
                                    height: 26,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          city,
                                          style: const TextStyle(
                                            fontSize: 15,
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
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 35, left: 12),
                    child: button(
                      width: 240,
                      heigth: 40,
                      color: Color.fromARGB(255, 234, 149, 53),
                      text: const Text('Ver Detalhes'),
                      onPressed: () {
                        Modular.to.navigate('/details');
                      },
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
