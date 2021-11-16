import 'package:flutter/material.dart';
import 'package:submission_bfaf_1/style/const.dart';
import 'package:submission_bfaf_1/widget/search_bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget _searchBar(){
      return SearchBar(isFocus: true);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              _searchBar()
            ],
          ),
        ),
      ),
    );
  }
}
