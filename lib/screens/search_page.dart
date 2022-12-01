import 'package:auto_route/auto_route.dart';
import 'package:bord/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../custom/custom_text_field.dart';
import '../custom/favorites_lv.dart';

enum Menu { byRating, byNewest, byAlphabet }

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: CustomTextField(
                  validator: null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(15),
                  ],
                  keyboardType: TextInputType.multiline,
                  textEditingController: _searchController,
                  prefixText: '',
                  hintText: '',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffE4E4E4))),
                      width: MediaQuery.of(context).size.width * 1,
                      child: ExpansionTile(
                        collapsedIconColor: Colors.green,
                        iconColor: Colors.green,
                        textColor: Colors.black,
                        collapsedTextColor: Colors.black,
                        title: const Text(
                          'Сортировка',
                          textAlign: TextAlign.center,
                        ),
                        trailing: Icon(
                          _customTileExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          size: 32,
                        ),
                        children: <Widget>[
                          ListTile(
                            title: const Text('По рейтингу'),
                            onTap: (() {}),
                          ),
                          ListTile(
                            title: const Text('По новизне'),
                            onTap: (() {}),
                          ),
                          ListTile(
                            title: const Text('По алфавиту'),
                            onTap: (() {}),
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {
                          setState(() => _customTileExpanded = expanded);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffE4E4E4))),
                      width: MediaQuery.of(context).size.width * 1,
                      child: ExpansionTile(
                        collapsedIconColor: Colors.green,
                        iconColor: Colors.green,
                        textColor: Colors.black,
                        collapsedTextColor: Colors.black,
                        title: const Text(
                          'Фильтры',
                          textAlign: TextAlign.center,
                        ),
                        trailing: SvgPicture.asset('images/more.svg'),
                        onExpansionChanged: (value) =>
                            context.router.push(const FilterScreenRoute()),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: LVSeparatedFavorites(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
