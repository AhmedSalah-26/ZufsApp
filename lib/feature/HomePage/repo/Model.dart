import 'package:json_annotation/json_annotation.dart';

part 'Model.g.dart';

@JsonSerializable()
class BatteryInfo {
  double? batteryCurrent;
  int? batteryHealth;
  double? batteryVoltage;
  int? chargingCapacity;
  int? power;
  double? temperature;

  BatteryInfo({
    this.batteryCurrent,
    this.batteryHealth,
    this.batteryVoltage,
    this.chargingCapacity,
    this.power,
    this.temperature,
  });

  // Factory constructor for creating a new instance from a map
  factory BatteryInfo.fromJson(Map<String, dynamic> json) => _$BatteryInfoFromJson(json);

  // Method for converting an instance into a map
  Map<String, dynamic> toJson() => _$BatteryInfoToJson(this);
}
