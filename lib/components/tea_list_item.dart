import 'package:flutter/material.dart';
import 'package:tea_app/modals/tea.dart';
import 'package:tea_app/pages/tea-detail-page.dart';

class TeaListItem extends StatelessWidget {
  final Tea _teaModal;

  TeaListItem(this._teaModal);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        leading: new CircleAvatar(
          backgroundImage: new NetworkImage(_teaModal.mediaUrl),
          radius: 35,
        ),
        title: new Text(
          _teaModal.name,
          style: new TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: new Text(
          _teaModal.receipt.toString() + ' recipes',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        trailing: new Icon(Icons.arrow_forward_ios, size: 18.0,),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TeaDetailPage(tea: _teaModal)),
            ));
//      contentPadding: EdgeInsets.all(1.0),
  }
}
