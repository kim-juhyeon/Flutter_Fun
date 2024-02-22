import 'package:flutter/material.dart';
import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note_manage_app/presentation/notes/components/note_item.dart';
import 'package:note_manage_app/presentation/notes/notes_view_model.dart';
import 'package:note_manage_app/ui/colors.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddEditNoteScreen()));
          },
          child: const Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: state.notes
                .map(
                  (note) => NoteItem(note: note),
                )
                .toList(),
          ),
        ));
  }
}
