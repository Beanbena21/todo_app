import 'package:flutter/material.dart';
import 'package:todo_app/models/items.dart';
import 'package:todo_app/models/provider_models.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/widgets/my_alert_dialog.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController _named = TextEditingController();
  TextEditingController _aged = TextEditingController();
  String _textNamed;
  String _textAged;

  @override
  void dispose() {
    super.dispose();
    _named.dispose();
    _aged.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: context.watch<ProviderModels>().items.length,
        itemBuilder: (context, index) => Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Name: ${context.watch<ProviderModels>().items[index].name}'),
            subtitle: Text('Age: ${context.watch<ProviderModels>().items[index].age}'),
          ),
          secondaryActions: [
            IconSlideAction(
              caption: 'Edit',
              color: Colors.blue,
              icon: Icons.edit,
              onTap: () {
                _named.text = context.read<ProviderModels>().items[index].name;
                _aged.text = context.read<ProviderModels>().items[index].age.toString();
                context.read<ProviderModels>().check(false);
                showDialog(
                  context: context,
                  builder: (BuildContext context) => MyAlertDialog(
                    textFirst: 'Edit Items',
                    textSecond: 'Save',
                    namedController: _named,
                    agedController: _aged,
                    onTap: () {
                      if (_named.text == '' || _aged.text == '') {
                        context.read<ProviderModels>().check(true);
                      } else {
                        setState(() {
                          context.read<ProviderModels>().items[index].name = _named.text;
                          context.read<ProviderModels>().items[index].age = int.parse(_aged.text);
                        });
                        context.read<ProviderModels>().check(false);
                        Navigator.pop(context);
                      }
                    },
                    errorNamed: context.watch<ProviderModels>().checkName ? 'Please enter your name' : null,
                    errorAged: context.watch<ProviderModels>().checkAge ? 'Please enter your age' : null,
                  ),
                );
              },
            ),
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              onTap: () => context.read<ProviderModels>().delItems(context.read<ProviderModels>().items[index]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () { _textNamed = null; _textAged = null; showDialog(
              context: context,
              builder: (BuildContext context) => MyAlertDialog(
                named: (value) => _textNamed = value,
                aged: (value) => _textAged = value,
                onTap: () {
                  if (_textNamed != null && _textAged != null) {
                    context.read<ProviderModels>().check(false);
                    context.read<ProviderModels>().addItems(Items(name: _textNamed, age: int.parse(_textAged)));
                    Navigator.pop(context);
                  }else {
                    context.read<ProviderModels>().check(true);
                  }
                },
                textFirst: 'Add Items',
                textSecond: 'Add',
                errorNamed: context.watch<ProviderModels>().checkName ? 'Please enter your name' : null,
                errorAged: context.watch<ProviderModels>().checkAge ? 'Please enter your age' : null,
              )
          );}
      ),
    );
  }
}