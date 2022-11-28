import 'package:hive/hive.dart';
part 'model.g.dart';

//flutter packages pub run build_runner build

void main(List<String> args) {}

@HiveType(typeId: 0)
class Trabalho extends HiveObject {
  @HiveField(0)
  int? tQConcluido;
  @HiveField(1)
  int? residencias;
  @HiveField(2)
  int? comercios;
  @HiveField(3)
  int? tBaldio;
  @HiveField(4)
  int? outros;
  @HiveField(5)
  int? tfocal;
  @HiveField(6)
  int? abertos;
  @HiveField(7)
  int? fechados;
  @HiveField(8)
  int? dEliminados;
  @HiveField(9)
  int? qGramas;
  @HiveField(10)
  int? qDTratados;
  @HiveField(11)
  int? tAgentes;
  @HiveField(12)
  DateTime? date = DateTime.now();
  @HiveField(13)
  String? agenteName;
  @HiveField(14)
  String? observacoes;

//Consctructor
  Trabalho(
    this.agenteName,
    this.date,
    this.tQConcluido,
    this.residencias,
    this.comercios,
    this.tBaldio,
    this.outros,
    this.tfocal,
    this.abertos,
    this.fechados,
    this.dEliminados,
    this.qGramas,
    this.qDTratados,
    this.tAgentes,
    this.observacoes,
  );

  List<Trabalho> gerarRelatorioSemanal(
      DateTime dataInicial, DateTime dataFinal) {
    return [];
  }
}

@HiveType(typeId: 1)
class Agentes extends HiveObject {
  @HiveField(0)
  String? name;
}
