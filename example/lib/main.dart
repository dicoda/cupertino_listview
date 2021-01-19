import 'package:cupertino_listview/internal/cupertino_listview_widget.dart';
import 'package:example/src/console.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CupertinoListView Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter CupertinoListView Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _data = Section.allData();
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: CupertinoListView.builder(
        sectionCount: _data.length,
        itemInSectionCount: (section) => _data[section].itemCount,
        sectionBuilder: _buildSection,
        childBuilder: _buildItem,
        separatorBuilder: _buildSeparator,
        controller: _scrollController,
      ),
    );
  }

  Widget _buildSeparator(BuildContext context, int section, int index, int absoluteIndex) {
    return Divider(indent: 20.0, endIndent: 20.0);
  }

  Widget _buildSection(BuildContext context, int section, int absoluteIndex) {
    final style = Theme.of(context).textTheme.headline6;
    return Container(
      height: 80.0,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20.0),
      color: Theme.of(context).primaryColorDark,
      child: Text(_data[section].name, style: style.copyWith(color: Colors.white)),
    );
  }

  Widget _buildItem(BuildContext context, int section, int index, int absoluteIndex) {
    final attribute = _data[section][index];
    return Container(
      padding: const EdgeInsets.all(20.0),
      constraints: BoxConstraints(minHeight: 50.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(child: Text(attribute.console), width: 120.0),
          Expanded(child: Text(attribute.attribute)),
        ],
      ),
    );
  }
}
