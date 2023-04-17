import 'package:bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String errMessage;

  const NewestBooksFailure(this.errMessage);
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  const NewestBooksSuccess(this.books);
}
