import 'package:flutter/material.dart';
import 'package:task_02_category_widget/category.dart';
import 'package:task_02_category_widget/unit.dart';

final _backgroundColor = Colors.green[100];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen();

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categories = <Category>[];

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _buildCategoryWidget(categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  /// Returns a list of mock [Unit]s.
  List<Unit> _retrieveUnitList(String categoryName) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        name: '$categoryName Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  /// Returns a [Category]
  Widget _cat(name, color, iconLocation, units) {
    return Category(
      name: name,
      color: color,
      iconLocation: iconLocation,
      units: units,
    );
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(_cat(
        _categoryNames[i],
        _baseColors[i],
        Icons.adb,
        _retrieveUnitList(_categoryNames[i]),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidget(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text('Unit Converter'),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
