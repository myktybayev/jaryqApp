import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  void getBooks() {
    emit(BooksInLoading());
  }

  /*
  Stream<List<Book>> noteStream() {
    final db = FirebaseFirestore.instance;

    try {
      return db.collection("books").snapshots.map((books) {
        final List<Book> notesFromFirestore = <Book>[];
        for (final DocumentSnapshot<Map<String, dynamic>> doc in books.docs) {
          notesFromFirestore.add(Book.fromDocumentSnapshot(doc: doc));
        }
        return notesFromFirestore;
      });
    } catch (e) {
      rethrow;
    }
  }
   */
}
