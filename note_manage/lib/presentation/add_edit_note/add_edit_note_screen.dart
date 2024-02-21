import 'package:flutter/material.dart';
import 'package:note_manage_app/ui/colors.dart';

class AddEditNoteScreen extends StatelessWidget {
  const AddEditNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: skyBlue,
        child: Column(
          children: [
            TextField(
              maxLines: 1,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                color: darkGray,
              ),
              decoration: const InputDecoration(
                hintText: '제목을 입력해주세요',
                border: InputBorder.none,
              ),
            ),
            TextField(
              maxLines: null,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                color: darkGray,
              ),
              decoration: const InputDecoration(
                hintText: '내용 입력해주세요',
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
