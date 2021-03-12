import 'package:blogger/blogs/av_blogs_section.dart';
import 'package:blogger/home/styled_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

class ExtendedBlogTabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var tabs = buildTabs(context);
      return showVerticalLayout(constraints)
          ? verticalTabs(tabs)
          : horizontalTabs(tabs);
    });
  }

  bool showVerticalLayout(BoxConstraints constraints) =>
      constraints.maxWidth < 600;

  Row horizontalTabs(List<Widget> tabs) {
    return Row(
      children: tabs..add(Spacer()),
    );
  }

  Column verticalTabs(tabs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tabs,
    );
  }

  List<Widget> buildTabs(BuildContext context) {
    return [
      styledTabItem("read", "Blog", () {
        Navigator.of(context).push(AVBlogsSection.route());
      }),
      styledTabItem("watch", "Presentations", () {
      }),
      styledTabItem("fork", "GitHub", () {
        launch("https://github.com/anmol92verma/");
      }),
      styledTabItem("mention", "Twitter", () {
        launch("https://twitter.com/_AnmolVerma_");
      })
    ];
  }

  Widget styledTabItem(String primary, String secondary, Function() callback) {
    return StylesTabItem(
      primary: primary,
      secondary: secondary,
      callback: callback,
    );
  }
}
