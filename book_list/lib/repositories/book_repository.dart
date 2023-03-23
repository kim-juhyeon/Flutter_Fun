import 'package:book_list/models/book.dart';

class Bookrepository {
  //
  final List<Book> _dummyBooks = [
    //Book 모델 객체를 가지고 있는 더미에 Book의 정보들을 포함 시킨다.

    Book(
      title: '패킺지',
      subtitle: '손으로 풀어보자 ',
      description: '설명서  ',
      image:
          'https://contents.lotteon.com/itemimage/_v073329/LI/16/13/20/99/21/_1/LI1613209921_1_1.jpg/dims/resizef/720X720',
    ),
    Book(
      title: '패',
      subtitle: '손으로 풀어보자 ',
      description: '설명서  ',
      image:
          'https://contents.lotteon.com/itemimage/_v073329/LI/16/13/20/99/21/_1/LI1613209921_1_1.jpg/dims/resizef/720X720',
    ),
    Book(
      title: '패키',
      subtitle: '손으로 풀어보자 ',
      description: '설명서  ',
      image:
          'https://contents.lotteon.com/itemimage/_v073329/LI/16/13/20/99/21/_1/LI1613209921_1_1.jpg/dims/resizef/720X720',
    ),
    Book(
      title: '패킺지',
      subtitle: '손으로 풀어보자 ',
      description: '설명서  ',
      image:
          'https://contents.lotteon.com/itemimage/_v073329/LI/16/13/20/99/21/_1/LI1613209921_1_1.jpg/dims/resizef/720X720',
    ),
  ];
  List<Book> getBooks() {
    return _dummyBooks;
  }
}
