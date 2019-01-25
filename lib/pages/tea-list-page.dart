import 'package:flutter/material.dart';
import 'package:tea_app/components/tea_list.dart';
import 'package:tea_app/modals/tea.dart';

class TeaPage extends StatelessWidget {
  _buildTeaList() {
    return <TeaModal>[
      const TeaModal(
        name: 'Moringa Mermaid',
        brand: 'Davids tea',
        receipt: 1,
        image: 'https://www.adagio.com/images5/products_index/dragon_pearl.jpg',
      ),
      const TeaModal(
          name: 'irish_breakfast',
          brand: 'Brand',
          receipt: 2,
          image:
              'https://www.adagio.com/images5/products_index/irish_breakfast.jpg'),
      const TeaModal(
          name: 'earl_grey_bella_luna',
          brand: 'Brand',
          receipt: 5,
          image:
              'https://www.adagio.com/images5/products_index/earl_grey_bella_luna.jpg'),
      const TeaModal(
          name: 'golden_monkey',
          brand: 'Brand',
          receipt: 55,
          image:
              'https://www.adagio.com/images5/products_index/golden_monkey.jpg'),
      const TeaModal(
          name: 'honeybush_banana_nut',
          brand: 'Brand',
          receipt: 15,
          image:
              'https://www.adagio.com/images5/products_index/honeybush_banana_nut.jpg'),
      const TeaModal(
          name: 'peppermint',
          brand: 'Brand',
          receipt: 11,
          image:
              'https://www.adagio.com/images5/products_index/peppermint.jpg'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new TeaList(_buildTeaList()));
  }
}
