import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final Function addFunction;

  AddPage(this.addFunction);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final idController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();

  void skickaTbx() {
    final id = idController.text;
    final title = titleController.text;
    final description = descriptionController.text;
    final image = imageController.text;
    final priceText = priceController.text;
    final price = double.parse(priceText);

    widget.addFunction(id, title, description, price, image);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add product')),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                label: Text('Id'),
              ),
              controller: idController,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Title'),
              ),
              controller: titleController,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Description'),
              ),
              controller: descriptionController,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Price'),
              ),
              controller: priceController,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            TextField(
              decoration: InputDecoration(
                label: Text('Image url'),
              ),
              controller: imageController,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
            ElevatedButton(onPressed: skickaTbx, child: Text('Spara')),
          ],
        ),
      ),
    );
  }
}
