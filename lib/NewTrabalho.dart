import 'package:controle_dengue/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //DateFormat
import 'package:hive_flutter/hive_flutter.dart';
import 'package:controle_dengue/model.dart';

import 'constants.dart';

class NewTrabalho extends StatefulWidget {
  NewTrabalho({Key? key}) : super(key: key);

  @override
  State<NewTrabalho> createState() => _NewTrabalhoState();
}

DateTime date = DateTime.now();
// String? municipio;
// String? codigoLocalidade;
// String? zona;
// String? categoriaLocalidade;
// bool? tipo;
// int? ciclo;
// DateTime? ano;
// DateTime? datafinal;
// bool? concluido;
// DateTime? semEpidem;
// String? atividade;
DateTime? data;
String? agenteName = 'Jake';
int tQConcluido = 0;
int residencias = 0;
int comercios = 0;
int tBaldio = 0;
int outros = 0;

int tfocal = 0;
int abertos = 0;
int fechados = 0;
int dEliminados = 0;
int qGramas = 0;
int qDTratados = 0;
int tAgentes = 0;
String? observacao;

class _NewTrabalhoState extends State<NewTrabalho> {
  @override
  void dispose() {
    Hive.close(); //free open boxes
    super.dispose();
  }

  Widget _buildRelatorio(context) {
    int Calc(x) {
      return x++;
    }

// ###################################################################### BUILDS
    Widget buildDatePicker() {
      TextEditingController _date = TextEditingController();
      _date.text = DateFormat('d MMM y').format(date);

      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
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
                    Text(DateFormat('d MMM y').format(date)),
                  ],
                )),
          ],
        ),
      );
    }

    Widget buildTQConcl(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                tQConcluido -= 1;
                tQConcluido = noNegative(tQConcluido);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tQConcluido -= 10);
                tQConcluido = noNegative(tQConcluido);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(tQConcluido.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(tQConcluido += 1);
                tQConcluido = noNegative(tQConcluido);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tQConcluido += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildResidencias(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                residencias -= 1;
                residencias = noNegative(residencias);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(residencias -= 10);
                residencias = noNegative(residencias);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(residencias.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(residencias += 1);
                residencias = noNegative(residencias);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(residencias += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildComercio(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                comercios -= 1;
                comercios = noNegative(comercios);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(comercios -= 10);
                comercios = noNegative(comercios);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(comercios.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(comercios += 1);
                comercios = noNegative(comercios);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(comercios += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildTerrenosBaldio(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                tBaldio -= 1;
                tBaldio = noNegative(tBaldio);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tBaldio -= 10);
                tBaldio = noNegative(tBaldio);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(tBaldio.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(tBaldio += 1);
                tBaldio = noNegative(tBaldio);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tBaldio += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildOutros(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                outros -= 1;
                outros = noNegative(outros);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(outros -= 10);
                outros = noNegative(outros);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(outros.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(outros += 1);
                outros = noNegative(outros);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(outros += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

// ##################################################################### DIVIDER

    Widget buildDepositosEliminados(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                dEliminados -= 1;
                dEliminados = noNegative(dEliminados);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(dEliminados -= 10);
                dEliminados = noNegative(dEliminados);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(dEliminados.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(dEliminados += 1);
                dEliminados = noNegative(dEliminados);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(dEliminados += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildAbertas(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                abertos -= 1;
                abertos = noNegative(abertos);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(abertos -= 10);
                abertos = noNegative(abertos);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(abertos.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(abertos += 1);
                abertos = noNegative(abertos);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(abertos += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildFechadas(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                fechados -= 1;
                fechados = noNegative(fechados);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(fechados -= 10);
                fechados = noNegative(fechados);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(fechados.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(fechados += 1);
                fechados = noNegative(fechados);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(fechados += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildTratamentoFocal(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                tfocal -= 1;
                tfocal = noNegative(tfocal);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tfocal -= 10);
                tfocal = noNegative(tfocal);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(tfocal.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(tfocal += 1);
                tfocal = noNegative(tfocal);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tfocal += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildQTDGramas(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                qGramas -= 1;
                qGramas = noNegative(qGramas);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(qGramas -= 10);
                qGramas = noNegative(qGramas);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(qGramas.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(qGramas += 1);
                qGramas = noNegative(qGramas);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(qGramas += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildQTDDepoTratados(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                qDTratados -= 1;
                qDTratados = noNegative(qDTratados);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(qDTratados -= 10);
                qDTratados = noNegative(qDTratados);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(qDTratados.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(qDTratados += 1);
                qDTratados = noNegative(qDTratados);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(qDTratados += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildTotalAgentes(BuildContext) {
      return Expanded(
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                tAgentes -= 1;
                tAgentes = noNegative(tAgentes);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tAgentes -= 10);
                tAgentes = noNegative(tAgentes);
              });
            },
            child: const Icon(Icons.remove),
          ),
          Text(tAgentes.toString()),
          RawMaterialButton(
            constraints: BoxConstraints.tight(const Size(36, 36)),
            onPressed: () {
              setState(() {
                noNegative(tAgentes += 1);
                tAgentes = noNegative(tAgentes);
              });
            },
            onLongPress: () {
              setState(() {
                noNegative(tAgentes += 10);
              });
            },
            child: const Icon(Icons.add),
          ),
        ]),
      );
    }

    Widget buildAgenteNamePicker() {
      showNameOptions() {
        return dummyAgentes.length != 0
            ? showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 15, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.close)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: dummyAgentes.length,
                            itemBuilder: (BuildContext context, int index) {
                              //Check if is editing
                              return Column(
                                children: [
                                  ListTile(
                                      leading: Icon(Icons.person),
                                      trailing: Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                        setState(() {
                                          agenteName = dummyAgentes[index];
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      title: Text(dummyAgentes[index])),
                                  Divider()
                                ],
                              );
                            }),
                      ),
                    ],
                  );
                })
            : () {};
      }

      return Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await showNameOptions();
                    setState(() {});
                  },
                  child: Text(agenteName.toString())),
            ],
          ),
        ),
      );
    }

    Widget buildObservacao() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          // focusNode: myFocusNode,
          initialValue: observacao,
          minLines: 3,
          maxLines: 7,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Observações'),

          onTap: () {},
          onSaved: (String? value) {
            observacao = value.toString();
          },
        ),
      );
    }
// ########################################################################## UI

    return SingleChildScrollView(
      primary: true,
      child: Column(children: [
        Card(
          elevation: 5,
          child: Column(
            children: [
              const ListTile(title: Text('Controle de Dengue')),
              myTile(Icons.date_range, 'Data', buildDatePicker()),
              myTile(Icons.portrait, 'Agente', buildAgenteNamePicker()),
              myTile(Icons.dashboard, 'Quarteirões Concluidos',
                  buildTQConcl(BuildContext)),
              myTile(Icons.home, 'Residências', buildResidencias(BuildContext)),
              myTile(Icons.store, 'Comércios', buildComercio(BuildContext)),
              myTile(Icons.crop_square, 'Terrenos Baldio',
                  buildOutros(BuildContext)),
              myTile(Icons.other_houses, 'Outros',
                  buildTerrenosBaldio(BuildContext)),
              const Divider(),
              Row(
                children: [
                  Expanded(
                      child: ListTile(
                    leading: const Icon(Icons.functions),
                    title: const Text('Total'),
                    trailing: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Text((tQConcluido +
                              residencias +
                              comercios +
                              tBaldio +
                              outros)
                          .toString()),
                    ),
                  )),
                ],
              )
            ],
          ),
        ),
        Card(
          elevation: 5,
          child: Column(
            children: [
              myTile(Icons.sanitizer, 'Tratamento Focal',
                  buildTratamentoFocal(BuildContext)),
              myTile(
                  Icons.lock_outline, 'Fechadas', buildFechadas(BuildContext)),
              myTile(Icons.delete_forever, 'Depositos Eliminados',
                  buildDepositosEliminados(BuildContext)),
              myTile(
                  Icons.scale, 'Quantidade (g)', buildQTDGramas(BuildContext)),
              myTile(Icons.health_and_safety, 'Depósitos tratados',
                  buildQTDDepoTratados(BuildContext)),
              myTile(Icons.person, 'Total de Agentes',
                  buildTotalAgentes(BuildContext)),
              myTile(Icons.lock_open, 'Abertas', buildAbertas(BuildContext)),
              buildObservacao(),
            ],
          ),
        ),
      ]),
    );
  }

// #################################################################### SCAFFOLD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await salvarTrabalho();
                setState(() {});
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.save))
        ],
        title: const Text('Novo Trabalho'),
      ),
      body: _buildRelatorio(context),
    );
  }
}

///Save all data in an object and push it to Hive Database
Trabalho salvarTrabalho() {
  Trabalho newTrabalho = Trabalho(
      agenteName,
      date,
      tQConcluido,
      residencias,
      comercios,
      tBaldio,
      outros,
      tfocal,
      abertos,
      fechados,
      dEliminados,
      qGramas,
      qDTratados,
      tAgentes,
      observacao);

  boxT.add(newTrabalho);
  print(newTrabalho.agenteName);
  print(newTrabalho.tQConcluido);
  return newTrabalho;
}
