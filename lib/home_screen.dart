import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenstate();
}

class _homescreenstate extends State<homescreen> {
  // Sample list of items
  final List<String> items = List.generate(10, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              " Users",
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 60,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: Container(
                width: 327,
                height: 507,
                margin: const EdgeInsets.only(left: 24, top: 56, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                /*   boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),*/

                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];
                    return Dismissible(
                        // Each item must have a unique key
                        key: UniqueKey(),
                        // Specify the swipe direction
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => onDelete(),
                        confirmDismiss: (DismissDirection direction) async {
                          // Show confirmation dialog before deleting
                          /*showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Confirm Delete'),
                              content:
                                  Text('Are you sure you want to delete ?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(false),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop(true),
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          );*/
                        },
                        // Child widget containing the tile's content
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Image.asset("image/img.png"),
                          ),
                          title: const Text(
                            'Merrill Kervin',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: const Text('merill.kervin@company.com'),
                        ),
                        // Background widget shown during swipe
                        background: Container(
                          //color: Colors.red,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              Icon(Icons.delete, color: Colors.red),
                            ],
                          ),
                        ));
                  },
                ),
              ),
            ),
            Container(
              width: 310,
              height: 65,
              margin: const EdgeInsets.only(left: 31, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(33.5), // half of the height
                color: const Color(0xFF0E3869),
                border: Border.all(
                  color: const Color(0xFFDEE3EF),
                  width: 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onDelete() {}
}
