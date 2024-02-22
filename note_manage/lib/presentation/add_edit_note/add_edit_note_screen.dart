import 'package:flutter/material.dart';
import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:note_manage_app/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:note_manage_app/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;
  const AddEditNoteScreen({super.key, this.note});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final List<Color> noteColors = [
    roseBud,
    primrose,
    wisteria,
    skyBlue,
    illusion
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_titleController.text.isEmpty ||
              _contentController.text.isEmpty) {
            const snackBar = SnackBar(content: Text('제목이나 내용이 비어 있습니다.'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          viewModel.onEvent(AddEditNoteEvent.saveNote(
            widget.note == null ? null : widget.note!.id, //id 값을 edit에서 noteScreen에 넘어가기 전에 id 값을 판별합니다.
            _titleController.text,
            _contentController.text,
          ));
        },
        child: const Icon(Icons.save),
      ),
      body: AnimatedContainer(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
        color: Color(viewModel.color),
        duration: const Duration(microseconds: 500),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map((color) => InkWell(
                      onTap: () {
                        viewModel
                            .onEvent(AddEditNoteEvent.changeColor(color.value));
                      },
                      child: _buildBackgroundColor(
                          color: color,
                          selected: viewModel.color == color.value)))
                  .toList(),
            ),
            TextField(
              controller: _titleController,
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
              controller: _contentController,
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

  Widget _buildBackgroundColor({required Color color, required bool selected}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          )
        ],
        border: selected ? Border.all(color: Colors.black, width: 3.0) : null,
      ),
    );
  }
}
