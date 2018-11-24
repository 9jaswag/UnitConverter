import 'package:flutter/material.dart';
// @required is defined in the meta.dart package
import 'package:meta/meta.dart';

import 'package:task_02_category_widget/converter_screen.dart';
import 'package:task_02_category_widget/unit.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

/// A custom [Category] widget.
///
/// The widget is composed on an [Icon] and [Text]. Tapping on the widget shows
/// a colored [InkWell] animation.
class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  /// Creates a [Category].
  ///
  /// A [Category] saves the name of the Category (e.g. 'Length'), its color for
  /// the UI, and the icon that represents it (e.g. a ruler).
  const Category(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.units,
      @required this.iconLocation})
      : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            title: Text(
              name,
              style: Theme.of(context).textTheme.display1,
            ),
            centerTitle: true,
            backgroundColor: color,
          ),
          body: ConverterScreen(
            name: name,
            color: color,
            units: units,
          ),
        );
      }
    ));
  }

  /// Builds a custom widget that shows [Category] information.
  ///
  /// This information includes the icon, name, and color for the [Category].
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () => _navigateToConverter(context),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(iconLocation, size: 60.0,),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
