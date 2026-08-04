import 'package:equatable/equatable.dart';

class Season extends Equatable {
  final int id;
  final String name;
  final int seasonNumber;

  const Season(
      {required this.id, required this.name, required this.seasonNumber});

  @override
  List<Object> get props => [id, name, seasonNumber];
}