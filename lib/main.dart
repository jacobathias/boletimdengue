import 'package:controle_dengue/NewTrabalho.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //DateFormat
import 'package:hive_flutter/hive_flutter.dart';
import 'package:controle_dengue/model.dart';

import 'constants.dart';

late Box boxT;
late Box boxA;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  //Adapters
  Hive.registerAdapter(TrabalhoAdapter());
  Hive.registerAdapter(AgentesAdapter());

  //Opening boxes
  boxT = await Hive.openBox<Trabalho>('trabalho_box');
  boxT = await Hive.openBox<Agentes>('agentes_box');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          listTileTheme: const ListTileThemeData(iconColor: (Colors.blue)),
          primaryIconTheme: const IconThemeData(color: (Colors.blue)),
          iconTheme: const IconThemeData(color: Colors.blue)),
      home: TrabalhosPage(),
    );
  }
}

class TrabalhosPage extends StatefulWidget {
  TrabalhosPage({Key? key}) : super(key: key);

  @override
  State<TrabalhosPage> createState() => _TrabalhosPageState();
}

class _TrabalhosPageState extends State<TrabalhosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trabalhos')),
      body: buildBody(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(context: context, builder: (context) => NewTrabalho());
        },
        label: const Text('Novo Trabalho'),
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Data Inicial:'),
              buildInitialDatePicker(),
              const Text('Data Final:'),
              buildEndlDatePicker()
            ],
          ),
          buildResultCard(),
          buildAgentesCard(),
          buildListaTrabalhos()
          // Card(child: ),
        ],
      ),
    );
  }

  Widget buildResultCard() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconSubtitle(Icons.dashboard, 'QC', 3),
                          IconSubtitle(Icons.home, 'R', 4),
                          IconSubtitle(Icons.store, 'C', 2),
                          IconSubtitle(Icons.square_outlined, 'TB', 6),
                          IconSubtitle(Icons.other_houses, 'O', 5),
                          IconSubtitle(Icons.functions, 'Total', 20),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconSubtitle(Icons.delete_forever, 'DE', 1),
                          IconSubtitle(Icons.not_interested, 'F', 1),
                          IconSubtitle(Icons.sanitizer, 'TF', 8),
                          IconSubtitle(Icons.scale, 'QG', 5),
                          IconSubtitle(Icons.health_and_safety, 'QDT', 5),
                          IconSubtitle(Icons.group, 'TA', 6),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Card(
            //     child: Center(child: Text('Total: 20')),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget buildAgentesCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('Dias Trabalhados por agente'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Jacob: 3 dias'),
                  Text('Marcos: 4 dias'),
                  Text('Alex: 4 dias'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Ricardo: 6 dias'),
                    Text('Sandro: 5 dias'),
                    Text('Silva: 4 dias'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInitialDatePicker() {
    TextEditingController _date = TextEditingController();
    // _date.text = DateFormat('MM-dd-yyyy').format(date);
    _date.text = DateFormat('d-M').format(date);

    return ElevatedButton(
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          ).then((value) {
            setState(() {
              value != null ? date = value : null;
              // incident.date = date;
              // dateChange = true;
            });
            return date;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateFormat('d-M').format(date)),
            // Expanded(child: Text(DateFormat('MM-dd-yyyy').format(date))),
          ],
        ));
  }

  Widget buildEndlDatePicker() {
    TextEditingController _date = TextEditingController();
    // _date.text = DateFormat('MM-dd-yyyy').format(date);
    _date.text = DateFormat('d-M').format(date);

    return ElevatedButton(
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          ).then((value) {
            setState(() {
              value != null ? date = value : null;
              // incident.date = date;
              // dateChange = true;
            });
            return date;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(DateFormat('d-M').format(date)),
            // Expanded(child: Text(DateFormat('MM-dd-yyyy').format(date))),
          ],
        ));
  }

  Widget buildListaTrabalhos() {
    return Expanded(
      child: ListView.builder(
        itemCount: boxT.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              leading: const Icon(Icons.receipt),
              title: Text(boxT.getAt(index).agenteName),
              trailing: Text(DateFormat('d MMM')
                  .format(boxT.getAt(index).date)
                  .toString()));
        },
      ),
    );
  }
}//Inside Set State ^
