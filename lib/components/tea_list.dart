import 'package:flutter/material.dart';

import 'package:tea_app/modals/tea.dart';
import 'package:tea_app/components/tea_list_item.dart';

class TeaList extends StatelessWidget {
  final List<Tea> _teaModal;

  TeaList(this._teaModal);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      children: _buildTeasList(context),
    );
  }

  List<Card> _buildTeasList(context) {
    return _teaModal
        .map((item) => new Card(
              child: new TeaListItem(item),
              color: Theme.of(context).cardColor,
              margin: EdgeInsets.all(0.25),
              shape: new Border.all(style: BorderStyle.none),
            ))
        .toList();
  }
}
