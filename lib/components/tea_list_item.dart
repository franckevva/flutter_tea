import 'package:flutter/material.dart';
import 'package:tea_app/modals/tea.dart';
import 'package:tea_app/pages/tea-detail-page.dart';

class TeaListItem extends StatelessWidget {
  final TeaModal _teaModal;

  TeaListItem(this._teaModal);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundImage: new NetworkImage(_teaModal.image),
      ),
      title: new Text(_teaModal.name),
      subtitle: new Text(
        _teaModal.receipt.toString() + ' recipes',
        style: TextStyle(fontStyle: FontStyle.italic),
      ),
      trailing: new Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TeaDetailPage(tea: _teaModal)),
      ));
//      contentPadding: EdgeInsets.all(1.0),
  }
}
