import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedNewestState extends Equatable {
  const FeaturedNewestState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends FeaturedNewestState {}

class NewestBooksLoading extends FeaturedNewestState {}

class NewestBooksFailure extends FeaturedNewestState {
  final String errMessage;

  const NewestBooksFailure(this.errMessage);
}

class NewestBooksSuccess extends FeaturedNewestState {
  final List<BookEntity> books;

  const NewestBooksSuccess(this.books);
}
