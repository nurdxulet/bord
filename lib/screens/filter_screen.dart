import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  final List<String> entries = <String>[
    'Грузинская',
    'Японская',
    'Американская',
    'Авторская',
    'Казахская',
    'Мексиканская'
  ];

  bool _customTileExpanded = false;

  int resultsNumber = 152;

  double minValue = 350.0;
  double maxValue = 45000.0;
  double sliderMin = 350;
  double sliderMax = 45000;

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Фильтр',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width * 0.3,
        leading: ElevatedButton.icon(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.green,
          ),
          label: const Text(
            'Назад',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Сбросить',
              style: TextStyle(
                color: Color(0xffA1A7B1),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExpansionTile(
              collapsedIconColor: Colors.green,
              iconColor: Colors.green,
              textColor: Colors.black,
              collapsedTextColor: Colors.black,
              title: const Text(
                'Кухня',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
              trailing: Icon(
                _customTileExpanded
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
                size: 32,
              ),
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return Container(
                      //   width: 40,
                      //   height: 40,
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.grey, width: 1),
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: Text(
                      //     overflow: TextOverflow.ellipsis,
                      //     ' ${entries[index]}',
                      //     textAlign: TextAlign.center,
                      //     style: const TextStyle(
                      //       color: Colors.black,
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // );
                      List<String> selectedItems = [];
                      return Container(
                        height: 40,
                        width: 40,
                        decoration: selectedItems.contains(entries[index])
                            ? BoxDecoration(
                                color: const Color(0xff0AAB39),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xffe4e4e4),
                                ),
                              )
                            : BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  width: 1,
                                  color: const Color(0xffe4e4e4),
                                ),
                              ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (selectedItems.contains(entries[index])) {
                                selectedItems.remove(entries[index]);
                              } else {
                                selectedItems.add(entries[index]);
                              }
                            });
                          },
                          child: Text(
                            entries[index],
                            style: selectedItems.contains(entries[index])
                                ? const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  )
                                : const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Wrap(
                //   children: [

                //   ],
                // ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
            ),
            Column(
              children: [
                const Text(
                  'Средний чек от 390 до 45000 тнг.',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0123,
                ),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        controller: startController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value) {
                          debugPrint('start onChanged $value');
                          final double? d = double.tryParse(value);
                          if (d == null) {
                            setState(() {
                              startController.text =
                                  sliderMin.toStringAsFixed(1);
                            });
                            return;
                          } else if (d <= maxValue && d >= minValue) {
                            if (d > sliderMax) {
                              startController.text =
                                  sliderMax.toStringAsFixed(1);
                            } else {
                              sliderMin = d;
                            }
                          } else if (d > maxValue) {
                            startController.text = sliderMax.toStringAsFixed(1);
                          }
                          setState(() {});
                        },
                        onFieldSubmitted: (String value) {
                          final double? d = double.tryParse(value);

                          if (d == null) {
                            startController.text = sliderMin.toStringAsFixed(1);
                            setState(() {});
                            return;
                          } else if (d < minValue) {
                            startController.text = sliderMin.toStringAsFixed(1);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: TextFormField(
                        controller: endController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (String value) {
                          debugPrint('end onChanged $value');
                          final double? d = double.tryParse(value);
                          if (d == null) {
                            setState(() {
                              endController.text = sliderMax.toStringAsFixed(1);
                            });
                            return;
                          }
                          if (d <= maxValue && d >= minValue) {
                            if (d < sliderMin) {
                              endController.text = sliderMin.toStringAsFixed(1);
                            } else {
                              sliderMax = d;
                            }
                          } else if (d > maxValue) {
                            endController.text = sliderMax.toString();
                          }
                          setState(() {});
                        },
                        onFieldSubmitted: (String value) {
                          final double? d = double.tryParse(value);
                          if (d == null) {
                            setState(() {
                              endController.text = sliderMax.toStringAsFixed(1);
                            });
                            return;
                          }
                          if (d < minValue) {
                            endController.text = sliderMin.toStringAsFixed(1);
                          }
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
                RangeSlider(
                  activeColor: Colors.green,
                  min: minValue,
                  max: maxValue,
                  onChanged: (values) {
                    setState(
                      () {
                        sliderMin = values.start;
                        sliderMax = values.end;
                        startController.text = sliderMin.toStringAsFixed(1);
                        endController.text = sliderMax.toStringAsFixed(1);
                      },
                    );
                  },
                  values: RangeValues(sliderMin, sliderMax),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 56,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff0AAB39),
                      ),
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Показать $resultsNumber результатов',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: const [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
