import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do Provider'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep),
            onPressed: provider.todos.isEmpty
                ? null
                : () {
                    showDialog(
                      context: context,
                      builder: (c) => AlertDialog(
                        title: const Text('Hapus Semua'),
                        content: const Text('Hapus semua kegiatan?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(c),
                            child: const Text('Batal'),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent,
                            ),
                            onPressed: () {
                              provider.clearAll();
                              Navigator.pop(c);
                            },
                            child: const Text('Hapus'),
                          ),
                        ],
                      ),
                    );
                  },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // input row
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Contoh: Belajar Flutter',
                      labelText: 'Tambah kegiatan',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _add(provider, context),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _add(provider, context),
                  child: const Text('Tambah'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // list
            Expanded(
              child: provider.todos.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.inbox, size: 64, color: Colors.grey),
                          SizedBox(height: 12),
                          Text(
                            'Belum ada kegiatan',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      itemCount: provider.todos.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final text = provider.todos[index];
                        return Dismissible(
                          key: Key('$text-$index'),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.redAccent,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          confirmDismiss: (_) async {
                            final res = await showDialog<bool>(
                              context: context,
                              builder: (c) => AlertDialog(
                                title: const Text('Hapus'),
                                content: Text('Hapus "$text"?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(c, false),
                                    child: const Text('Batal'),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.redAccent,
                                    ),
                                    onPressed: () => Navigator.pop(c, true),
                                    child: const Text('Hapus'),
                                  ),
                                ],
                              ),
                            );
                            return res ?? false;
                          },
                          onDismissed: (_) {
                            provider.removeTodoAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Item dihapus')),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(text),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.redAccent,
                                ),
                                onPressed: () {
                                  provider.removeTodoAt(index);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _add(TodoProvider provider, BuildContext context) {
    final text = _controller.text;
    if (text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi kegiatan dulu')));
      return;
    }
    provider.addTodo(text);
    _controller.clear();
    // focus kembali ke input
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
