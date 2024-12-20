import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}


class FetchNews extends NewsEvent {}

class FetchMoreNews extends NewsEvent {}