import 'package:flutter/material.dart';
import 'package:ruhani_app/features/books/domain/book.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookReader extends StatefulWidget {
  final Book book;

  const BookReader({required this.book, Key? key}) : super(key: key);

  @override
  State<BookReader> createState() => _BookReaderState();
}

class _BookReaderState extends State<BookReader> {
  @override
  Widget build(BuildContext context) {
    // final book = ModalRoute.of(context)!.settings.arguments as Book;

    final _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(widget.book.uri));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
