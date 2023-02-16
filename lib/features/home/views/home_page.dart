import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import '../components/Horizontalcard.dart';
import '../components/Verticalcard.dart';
import '../models/home_models.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  String get title => 'Agenda de Leilões';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Auctions>> map;

  @override
  void initState() {
    super.initState();
    map = modelslist();
    map.then((value) => value.forEach((element) => print(element.toJson())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 212, 212),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Modular.to.navigate('/auth');
          },
        ),
        title: Text(
          widget.title,
        ),
        backgroundColor: const Color.fromARGB(255, 10, 43, 71),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                height: 260.0,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 260,
                      child: FutureBuilder<List<Auctions>>(
                          future: map,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, index) {
                                  return HorizontalCardHome(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            "https://www.elomsleiloesrurais.com.br/envios/folder_11.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                    title:
                                        snapshot.data![index].name.toString(),
                                    city: snapshot.data![index].city.toString(),
                                    horas:
                                        snapshot.data![index].date.toString(),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            return const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 0, right: 170, top: 0, bottom: 10),
                  child: SizedBox(
                    child: Text(
                      'AGENDA DE LEILÕES',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Container(
                  height: 350,
                  child: FutureBuilder<List<Auctions>>(
                      future: map,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, index) {
                              return CardHome(
                                title: snapshot.data![index].name.toString(),
                                city: snapshot.data![index].city.toString(),
                                horas: snapshot.data![index].date.toString(),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        return const Scaffold(
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Auctions>> modelslist() async {
    var header = {
      'app': 'ee85db5d-ebec-4548-a62b-ae8c68955d31',
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json'
    };

    var request = Uri.parse(
      'https://bis365.com.br/bid365/api/v1/auctions',
    );
    final response = await http.get(
      request,
      headers: header,
    );
    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      try {
        List<dynamic> jsonBody = jsonDecode(response.body)['data'];
        print(jsonBody);
        List<Auctions> auctions = [];

        jsonBody.forEach((data) {
          var auction = Auctions(
            id: data['id'],
            name: data['name'],
            time: data['time'],
            date: data['date'],
            city: data['city'],
            image: data['image'],
            desk_one: data['desk_one'],
          );

          // print("Auction: ${auction.toJson()}");
          auctions.add(auction);
        });

        return auctions;
      } catch (e) {
        throw e;
      }
    } else {
      throw Exception('Falha ao conectar');
    }
  }
}
