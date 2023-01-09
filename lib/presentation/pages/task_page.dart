import 'package:flutter/material.dart';
import 'package:poloris/model/task_model.dart';
import 'package:poloris/shared/enum/category_enum.dart';
import 'package:poloris/shared/utils/category_map.dart';
import '../widgets/index.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  CategoryEnum _category = CategoryEnum.health;
  final List<Task> _tasks = <Task>[];
  String title = '';
  TextEditingController myController = TextEditingController();

  void _showModal() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
      ),
      builder: (BuildContext context) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              height: 320,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('New Task ', style: TextStyle(fontSize: 30)),
                            Icon(Icons.task, size: 30)
                          ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task',
                        hintText: 'Enter task',
                      ),
                      controller: myController,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                    child: Text('Category', style: TextStyle(fontSize: 20)),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: DropdownButton(
                        value: _category,
                        borderRadius: BorderRadius.circular(10),
                        items: const <DropdownMenuItem>[
                          DropdownMenuItem(
                            value: CategoryEnum.health,
                            child: Text('Health'),
                          ),
                          DropdownMenuItem(
                            value: CategoryEnum.personal,
                            child: Text('Personal'),
                          ),
                          DropdownMenuItem(
                            value: CategoryEnum.study,
                            child: Text('Study'),
                          ),
                          DropdownMenuItem(
                            value: CategoryEnum.work,
                            child: Text('Work'),
                          ),
                        ],
                        onChanged: (value) {
                          setModalState(() {
                            _category = value;
                          });
                          setState(() {
                            _category = value;
                          });
                        },
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        isExpanded: true,
                      ),
                    ),
                  ),
                  // Add Select category here
                  Center(
                    child: myController.text.isNotEmpty
                        ? ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 50)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.brown[300]!),
                            ),
                            child: const Text('Create Task'),
                            onPressed: () => {
                              if (myController.text.isNotEmpty)
                                {
                                  _addTasK(),
                                  Navigator.pop(context),
                                }
                            },
                          )
                        : ElevatedButton(
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all<Size>(
                                  const Size(200, 50)),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.grey),
                            ),
                            child: const Text('Create Task'),
                            onPressed: () => {},
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _addTasK() {
    setState(() {
      title = myController.text;
      myController.clear();
      int currentTime = DateTime.now().millisecondsSinceEpoch;
      _tasks.add(Task(
        id: currentTime,
        date: DateTime.now().toIso8601String(),
        time: currentTime,
        title: title,
        category: _category,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(
          title: 'Tasks',
          disableIcon: false,
          iconData: Icons.task_alt,
        ),
        body: _tasks.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text('Nothing today!', style: TextStyle(fontSize: 40)),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    final item = _tasks[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Dismissible(
                        direction: DismissDirection.startToEnd,
                        key: Key(item.id.toString()),
                        onDismissed: (direction) {
                          setState(() {
                            _tasks.removeAt(index);
                          });
                        },
                        background: Container(
                            alignment: Alignment.centerLeft,
                            color: const Color.fromARGB(255, 5, 83, 8),
                            child: const Text(
                              'Completed',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            )),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: categoryMapIconData[item.category],
                              ),
                              Expanded(
                                child: Text(
                                  item.title,
                                  style: const TextStyle(fontSize: 30),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showModal();
          },
          tooltip: 'Add task',
          backgroundColor: Colors.brown[300],
          child: const Icon(
            Icons.add,
          ),
        ),
        bottomNavigationBar: const BottomNavigationBarWidget(2));
  }
}
