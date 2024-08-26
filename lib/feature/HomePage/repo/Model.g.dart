// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatteryInfo _$BatteryInfoFromJson(Map<String, dynamic> json) => BatteryInfo(
      batteryCurrent: (json['batteryCurrent'] as num?)?.toDouble(),
      batteryHealth: (json['batteryHealth'] as num?)?.toInt(),
      batteryVoltage: (json['batteryVoltage'] as num?)?.toDouble(),
      chargingCapacity: (json['chargingCapacity'] as num?)?.toInt(),
      power: (json['power'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BatteryInfoToJson(BatteryInfo instance) =>
    <String, dynamic>{
      'batteryCurrent': instance.batteryCurrent,
      'batteryHealth': instance.batteryHealth,
      'batteryVoltage': instance.batteryVoltage,
      'chargingCapacity': instance.chargingCapacity,
      'power': instance.power,
      'temperature': instance.temperature,
    };
