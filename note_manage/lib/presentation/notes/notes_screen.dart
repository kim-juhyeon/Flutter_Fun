import 'package:flutter/material.dart';
import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note_manage_app/presentation/notes/components/note_item.dart';
import 'package:note_manage_app/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your note',
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            )
          ],
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AddEditNoteScreen()));
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              NoteItem(
                note: Note(
                  title: 'title 1',
                  content: 'content 1',
                  color: wisteria.value,
                  timeStamp: 1,
                ),
              ),
              NoteItem(
                note: Note(
                  title: 'title 2',
                  content: 'content 2',
                  color: skyBlue.value,
                  timeStamp: 1,
                ),
              ),
            ],
          ),
        ));
  }
}
