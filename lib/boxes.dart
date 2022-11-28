import 'package:hive/hive.dart';
import 'package:controle_dengue/model.dart';

class Boxes {
  static Box<Trabalho> getTrabalho() => Hive.box<Trabalho>('trabalho_box');
}
