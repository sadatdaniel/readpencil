import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

List _filters = ['World Politics'];
List<Filter> filterList = [];
String filterTable = 'filter_table';
String columnName = 'name';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    super.initState();
    updateCategories(_filters);
    print(_filters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfcfcfc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFfcfcfc),
        title: Text(
          "Subscriptions",
          style: TextStyle(
              fontFamily: 'Spartan',
              fontWeight: FontWeight.w900,
              color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //will add title
            title("Technology"),
            SizedBox(height: 10),
            category(technology),
            SizedBox(height: 20),
            title("Politics"),
            SizedBox(height: 10),
            category(politics),
            SizedBox(height: 20),
            title("Lifestyle"),
            SizedBox(height: 10),
            category(lifestyle),
            SizedBox(height: 20),
            title("Sports"),
            SizedBox(height: 10),
            category(sports),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(520)),
                  onPressed: () {
                    //print(_filters);
                    updateCategories(_filters);
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

updateCategories(categoryList) async {
  var box = await Hive.openBox('categories');
  box.put('categories', categoryList);
  print(box.get('categories'));
}

title(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'Spartan',
            fontWeight: FontWeight.w900,
            color: Colors.black),
      ),
    ),
  );
}

category(List topics) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Container(
        child: Wrap(
          spacing: 5,
          runSpacing: 3.0,
          children: topics,
        ),
      ),
    ),
  );
}

List<Widget> technology = [
  FilterWidget(name: 'Open Source'),
  FilterWidget(name: 'Linux'),
  FilterWidget(name: 'Apple'),

  // FilterWidget(name: 'Smart Phones'),
  // FilterWidget(name: 'Gedgets'),
];

List<FilterWidget> politics = [
  FilterWidget(name: 'World Politics'),
];

List<FilterWidget> lifestyle = [
  FilterWidget(name: 'Food Science'),
];

List<FilterWidget> sports = [
  FilterWidget(name: 'Cricket'),
  FilterWidget(name: 'Football'),
];

class FilterWidget extends StatefulWidget {
  final String name;

  FilterWidget({Key key, this.name}) : super(key: key);
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  var _isSelected;

  @override
  Widget build(BuildContext context) {
    if (_filters.contains(widget.name)) {
      setState(() {
        _isSelected = true;
      });
    } else {
      setState(() {
        _isSelected = false;
      });
    }

    return FilterChip(
      selectedColor: Colors.black,
      checkmarkColor: Colors.white,
      label: Text(
        widget.name,
        style: TextStyle(
            fontFamily: 'Spartan',
            fontWeight: FontWeight.w800,
            color: _isSelected ? Colors.white : Colors.black),
      ),
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
          if (isSelected) {
            _filters.add(widget.name);
            updateCategories(_filters);
            // insertFilter(widget.name);
          } else {
            _filters.remove(widget.name);
            updateCategories(_filters);
            // classify(_filters, 'remove');
            // _filters.remove(widget.name);
          }
          print(_filters);
        });
      },
    );
  }
}

class Filter {
  String name;
  Filter({this.name});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['name'] = name;

    return map;
  }

  // Extract a Note object from a Map object
  Filter.fromMapObject(Map<String, dynamic> map) {
    this.name = map['name'];
  }
}
