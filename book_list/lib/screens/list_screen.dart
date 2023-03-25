import 'package:book_list/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/book.dart';
import '../repositories/book_repository.dart';
import 'bootitle.dart';

class ListScreen extends StatelessWidget {
  final List<Book> books = Bookrepository().getBooks(); //코드 정리 및 repository를 반환 하기 위해 getBooks을 호출시킨다. 
  //getBooks - 더미 북스에 있는 책 목록을 반환한다.
  /*위의 코드에서는 BookRepository 클래스의 인스턴스를 생성하고, 
  getBooks() 메소드를 호출하여 _dummyBooks 필드에 저장된 책 목록을 books 변수에 할당하고 있습니다. 
  이후 books 변수를 사용하여 책 목록을 표시할 수 있습니다.*/

  ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('도서 목록 앱'),
      ),
      body: ListView.builder(
        itemCount: books.length, //books 는 detail의 넘어가는 정보이지만 , 갯수는 동일해야 하므로 ListView에 정보를 입력한다.
        itemBuilder: (context, index) {
          return BookTile(book: books[index]);  //BookTile 에 books 
          //itemBuilder에는 BookTile 위젯을 반환하는 콜백 함수를 설정하고 있습니다. BookTile 위젯은 Book 객체를 받아 해당 책의 정보를 화면에 표시하는 역할을 합니다.


        },
      ),
    );
  }
}

