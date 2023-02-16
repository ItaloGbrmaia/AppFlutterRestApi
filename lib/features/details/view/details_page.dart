import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: camel_case_types
class Details_Page extends StatefulWidget {
  const Details_Page({super.key});

  String get title => 'Detalhes';

  @override
  State<Details_Page> createState() => _Details_PageState();
}

// ignore: camel_case_types
class _Details_PageState extends State<Details_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 212, 212),
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/home');
          },
        ),
        backgroundColor: const Color.fromARGB(255, 10, 43, 71),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 450,
                height: 550,
                child: Card(
                  color: const Color.fromARGB(255, 231, 231, 231),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 20, bottom: 0),
                        child: SizedBox(
                          width: 330,
                          height: 175,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 0, top: 0, bottom: 0),
                                child: Container(
                                  width: 150,
                                  height: 180,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          "https://www.elomsleiloesrurais.com.br/envios/folder_11.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 17.0, right: 0, top: 12, bottom: 0),
                                child: Column(
                                  children: const [
                                    SizedBox(
                                      width: 150,
                                      height: 55,
                                      child: Text(
                                        "Leilão Hosp, AMOR S.F Sales",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 20,
                                      child: Text(
                                        "INFORMAÇÔES",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: Text(
                                        "0800 049 200 \n(49) 98402 3763",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30.0, right: 30, top: 20, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 145,
                              height: 38,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 0, bottom: 0),
                                child: ElevatedButton(
                                  onPressed: () {/* Do something */},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor:
                                        const Color.fromARGB(255, 219, 157, 32),
                                  ),
                                  child: const Text(
                                    'CATALOGO',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 145,
                              height: 38,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 0, bottom: 0),
                                child: ElevatedButton(
                                  onPressed: () {/* Do something */},
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black,
                                    backgroundColor:
                                        const Color.fromARGB(255, 219, 157, 32),
                                  ),
                                  child: const Text(
                                    'REGULAMENTO',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0, right: 0, top: 12, bottom: 0),
                        child: SizedBox(
                          width: 300,
                          height: 80,
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text(
                                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard',
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              child: SizedBox(
                                width: 300,
                                height: 80,
                                child: Card(
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 0,
                                            bottom: 0),
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 8, 39, 64),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Icon(
                                              Icons.calendar_month_rounded,
                                              size: 45,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 10,
                                            bottom: 0),
                                        child: Column(
                                          children: const [
                                            SizedBox(
                                              width: 200,
                                              height: 25,
                                              child: Text(
                                                'Data/Horario',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              height: 30,
                                              child: Text(
                                                '04/01/2021              23:00',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 8, bottom: 0),
                              child: SizedBox(
                                width: 300,
                                height: 80,
                                child: Card(
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 0,
                                            bottom: 0),
                                        child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 8, 39, 64),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: const Icon(
                                              Icons.location_on_outlined,
                                              size: 45,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0,
                                            right: 0,
                                            top: 10,
                                            bottom: 0),
                                        child: Column(
                                          children: const [
                                            SizedBox(
                                              width: 200,
                                              height: 25,
                                              child: Text(
                                                'Local',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 200,
                                              height: 30,
                                              child: Text(
                                                'AV. São Francisco de sales, rua 30 com a 1 - MG',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: 500,
                    height: 500,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      color: const Color.fromARGB(255, 231, 231, 231),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 180, top: 10),
                            child: Text(
                              'Imagens do Leilão',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Card(
                                      shape: const RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: Color.fromARGB(
                                              255, 220, 219, 219),
                                          width: 1,
                                        ),
                                      ),
                                      color: const Color.fromARGB(
                                          255, 244, 242, 242),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0,
                                                  right: 0,
                                                  top: 16,
                                                  bottom: 10),
                                              child: Container(
                                                width: 170,
                                                height: 230,
                                                decoration: const BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                          "https://www.embral.com.br/leiloes/1468/img/capa_1468.jpeg",
                                                        ),
                                                        fit: BoxFit.cover)),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 300,
                                            height: 150,
                                            child: Padding(
                                              padding: EdgeInsets.all(1),
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                child: const Text(
                                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley',
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
          ],
        ),
      ),
    );
  }
}
