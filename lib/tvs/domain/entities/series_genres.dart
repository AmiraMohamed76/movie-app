import 'package:equatable/equatable.dart';

class SeriesGenres extends Equatable{
  final int id;
  final String name;

  const SeriesGenres({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];


}