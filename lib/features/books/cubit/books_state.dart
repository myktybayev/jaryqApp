part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BooksInLoading extends BooksState {}

final class BooksInLoaded extends BooksState {}

final class BooksInFailed extends BooksState {
  final String errorMessage;

  BooksInFailed({required this.errorMessage});
}
