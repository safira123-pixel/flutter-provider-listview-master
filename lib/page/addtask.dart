import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_listview/service/tasklist.dart';

class AddTaskPage extends StatelessWidget {
AddTaskPage({super.key});

final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Task Baru"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Masukkan Task Baru",
                errorText: context.watch<Tasklist>().taskName.error,
              ),
              controller: _controller,
              onChanged: (value) {
                               context.read<Tasklist>().onTaskNameChange(value);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                   onPressed: context.watch<Tasklist>().isActive
                        ? () {
                            context
                                .read<Tasklist>()
                                .setTaskName(_controller.text);

                            if (context.read<Tasklist>().isValidated()) {
                              context.read<Tasklist>().addNewTask(
                                    _controller.text,
                                  );
                              Navigator.pop(context);
                            }
                          }
                        : null,
                    child: const Text("Tambah Task Baru"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
