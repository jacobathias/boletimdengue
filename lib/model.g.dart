// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrabalhoAdapter extends TypeAdapter<Trabalho> {
  @override
  final int typeId = 0;

  @override
  Trabalho read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Trabalho(
      fields[13] as String?,
      fields[12] as DateTime?,
      fields[0] as int?,
      fields[1] as int?,
      fields[2] as int?,
      fields[3] as int?,
      fields[4] as int?,
      fields[5] as int?,
      fields[6] as int?,
      fields[7] as int?,
      fields[8] as int?,
      fields[9] as int?,
      fields[10] as int?,
      fields[11] as int?,
      fields[14] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Trabalho obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.tQConcluido)
      ..writeByte(1)
      ..write(obj.residencias)
      ..writeByte(2)
      ..write(obj.comercios)
      ..writeByte(3)
      ..write(obj.tBaldio)
      ..writeByte(4)
      ..write(obj.outros)
      ..writeByte(5)
      ..write(obj.tfocal)
      ..writeByte(6)
      ..write(obj.abertos)
      ..writeByte(7)
      ..write(obj.fechados)
      ..writeByte(8)
      ..write(obj.dEliminados)
      ..writeByte(9)
      ..write(obj.qGramas)
      ..writeByte(10)
      ..write(obj.qDTratados)
      ..writeByte(11)
      ..write(obj.tAgentes)
      ..writeByte(12)
      ..write(obj.date)
      ..writeByte(13)
      ..write(obj.agenteName)
      ..writeByte(14)
      ..write(obj.observacoes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrabalhoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AgentesAdapter extends TypeAdapter<Agentes> {
  @override
  final int typeId = 1;

  @override
  Agentes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Agentes()..name = fields[0] as String?;
  }

  @override
  void write(BinaryWriter writer, Agentes obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AgentesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
