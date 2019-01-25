import 'package:flutter/material.dart';
import 'package:tea_app/modals/tea.dart';
import 'package:tea_app/components/tea_list_item.dart';

class TeaList extends StatelessWidget {
  final List<TeaModal> _teaModal;

  TeaList(this._teaModal);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: _buildTeasList(),
    );
  }

  List<TeaListItem> _buildTeasList() {
    return _teaModal.map((tea) => new TeaListItem(tea)).toList();
  }
}
