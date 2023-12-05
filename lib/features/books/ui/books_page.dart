import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruhani_app/features/books/domain/book.dart';
import 'package:ruhani_app/routing/app_roures.dart';

/*
with state:

_runSearch
_runFilter
showBottomModal
getData
 */

class BooksPage extends StatefulWidget {
  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  List<Book> bookList = [
    Book(
        title: 'Kazakhstan kitap',
        author: 'Muftiyat',
        category: 'Kazakhstan',
        uri:
            'https://www.muftyat.kz/static/libs/pdfjs/web/viewer.html?file=/media/muftyat/30%20%D0%B6%D1%8B%D0%BB%D0%B4%D1%8B%D2%9B%20%D0%BA%D1%96%D1%82%D0%B0%D0%BF.pdf'),
    Book(
        title: 'Kazakhstan kitap',
        author: 'Muftiyat',
        category: 'Kazakhstan',
        uri:
            'https://www.muftyat.kz/static/libs/pdfjs/web/viewer.html?file=/media/muftyat/30%20%D0%B6%D1%8B%D0%BB%D0%B4%D1%8B%D2%9B%20%D0%BA%D1%96%D1%82%D0%B0%D0%BF.pdf'),
    Book(
        title: 'Uly dala',
        author: 'Muftiyat',
        category: 'Uly',
        uri:
            'https://www.muftyat.kz/static/libs/pdfjs/web/viewer.html?file=/media/muftyat/book_6350.pdf'),
    Book(
        title: 'Arman Orman',
        author: 'Muftiyat',
        category: 'Arman',
        uri:
            'https://www.muftyat.kz/static/libs/pdfjs/web/viewer.html?file=/media/muftyat/book_6350.pdf'),
    Book(
        title: 'Kitap Mitap',
        author: 'Muftiyat',
        category: 'Arman',
        uri:
            'https://www.muftyat.kz/static/libs/pdfjs/web/viewer.html?file=/media/muftyat/book_6350.pdf'),
  ];

  readBook(BuildContext context, int index) {
    Navigator.pushNamed(
      context,
      AppRoutes.bookReader,
      arguments: bookList[index],
    );
  }

  showSnackBar(String gesture) {
    var snackBar = SnackBar(
      content: Text('You $gesture'),
    );

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<Book> foundBooks = [];

  void _runSearch(String enteredKeyword) {
    List<Book> results = [];
    if (enteredKeyword.isEmpty) {
      results = bookList;
    } else {
      results = bookList
          .where((book) =>
              book.title.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      foundBooks = results;
    });
  }

  void _runFilter(String category) {
    List<Book> results = [];
    if (category.isEmpty) {
      results = bookList;
    } else {
      results = bookList
          .where((book) =>
              book.category.toLowerCase().contains(category.toLowerCase()))
          .toList();
    }

    setState(() {
      foundBooks = results;
    });
  }

  @override
  initState() {
    // foundBooks = bookList;

    print('initState');
    super.initState();
  }

  final bookStream = FirebaseFirestore.instance.collection('books').snapshots();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: [
              TextField(
                onChanged: (value) => _runSearch(value),
                decoration: const InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
              ChoiceChip(
                label: Text("filter"),
                selected: false,
                onSelected: (value) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Wrap(
                          children: [
                            InkWell(
                              child: const ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Барлығы'),
                              ),
                              onTap: () {
                                _runFilter('');
                                Navigator.pop(context);
                              },
                            ),
                            InkWell(
                              child: const ListTile(
                                leading: Icon(Icons.share),
                                title: Text('Kazakhstan'),
                              ),
                              onTap: () {
                                _runFilter('Kazakhstan');
                                Navigator.pop(context);
                              },
                            ),
                            InkWell(
                              child: const ListTile(
                                leading: Icon(Icons.copy),
                                title: Text('Uly'),
                              ),
                              onTap: () {
                                _runFilter('Uly');
                                Navigator.pop(context);
                              },
                            ),
                            InkWell(
                              child: const ListTile(
                                leading: Icon(Icons.paste),
                                title: Text('Arman'),
                              ),
                              onTap: () {
                                _runFilter('Arman');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
              ChoiceChip(
                label: Text("getData"),
                selected: false,
                onSelected: (value) {
                  // getData();
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: foundBooks.isEmpty
                ? bookListFirestore()
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }

  Widget bookListFirestore() {
    return StreamBuilder(
        stream: bookStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final books = snapshot.data?.docs.toList();
            for (var book in books!) {
              
              print("book: ${book['title']}");

              foundBooks.add(Book(
                  title: book['title'],
                  author: book['author'],
                  category: book['category'],
                  uri: book['uri']));
            }
            setState(() {});
          }

          return ListView.builder(
              itemCount: foundBooks.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    readBook(context, index);
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        title: Text(
                          foundBooks[index].title,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: const Icon(
                          Icons.book,
                          size: 50,
                        ),
                        trailing: const Text("Read"),
                      ),
                    ),
                  ),
                );
              });
        });
  }

  Widget bookListView() {
    return ListView.builder(
        itemCount: foundBooks.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              readBook(context, index);
            },
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(
                    foundBooks[index].title,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  leading: const Icon(
                    Icons.book,
                    size: 50,
                  ),
                  trailing: const Text("Read"),
                ),
              ),
            ),
          );
        });
  }
}
