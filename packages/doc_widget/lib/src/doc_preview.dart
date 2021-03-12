import 'package:doc_widget/doc_widget.dart';
import 'package:doc_widget/src/styles/colors.dart';
import 'package:doc_widget/src/styles/spaces.dart';
import 'package:doc_widget/src/utils/platform.dart';
import 'package:doc_widget/src/widgets/app_bar.dart';
import 'package:doc_widget/src/widgets/drawer.dart';
import 'package:doc_widget/src/widgets/item.dart';
import 'package:flutter/material.dart';

/// Flutter application responsible to show all elements that are generated.
class DocPreview extends StatefulWidget {
  DocPreview({required this.elements, this.title});

  final List<ElementPreview> elements;
  final String? title;

  @override
  _DocPreviewState createState() => _DocPreviewState();
}

class _DocPreviewState extends State<DocPreview> {
  late ElementPreview _selectedItem;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _selectedItem = widget.elements.first;
    super.initState();
  }

  void setSelectedItem(ElementPreview selectedItem) {
    setState(() {
      _selectedItem = selectedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget renderBody() {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spaces.goldenDream,
            vertical: Spaces.geraldine,
          ),
          child: Item(_selectedItem),
        ),
      );
    }

    Widget renderDrawer() {
      return DrawerCustom(
        title: widget.title,
        elements: widget.elements,
        onTap: (selectedItem) {
          setSelectedItem(selectedItem);
          if (_scaffoldKey.currentState!.isDrawerOpen && isMobile()) {
            _scaffoldKey.currentState!.openEndDrawer();
          }
        },
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: ColorsDoc.white),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: isMobile() ? renderDrawer() : null,
        appBar: isMobile()
            ? PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: AppBarCustom(title: _selectedItem.document.name),
              )
            : null,
        body: isMobile()
            ? renderBody()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  renderDrawer(),
                  Expanded(child: renderBody()),
                ],
              ),
      ),
    );
  }
}
