import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MyAppState.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //*/
    var appState = context.watch<MyAppState>();
    var prevDateInMonth =
        appState.getDaysInMonth(appState.currentYear, appState.currentMonth);
    var dateInMonth =
        appState.getDaysInMonth(appState.currentYear, appState.currentMonth);

    return Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'October',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ExpandedHeader(header: 'Sun'),
                      ExpandedHeader(header: 'Mon'),
                      ExpandedHeader(header: 'Tue'),
                      ExpandedHeader(header: 'Wed'),
                      ExpandedHeader(header: 'Thu'),
                      ExpandedHeader(header: 'Fri'),
                      ExpandedHeader(header: 'Sat'),
                    ],
                  ),
                  SizedBox(
                    height: 500.0,
                    child: GridView.count(
                        crossAxisCount: 7,
                        children: List.generate(
                          35,
                          (index) {
                            return Expanded(
                              child: Container(
                                color: Colors.blue,
                                margin: const EdgeInsets.all(1),
                                child: Center(
                                  child: Text(
                                    'Item $index',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
    // */
  }
}

class ExpandedHeader extends StatelessWidget {
  const ExpandedHeader({
    super.key,
    required this.header,
  });

  final String header;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      header,
      maxLines: 1,
      textAlign: TextAlign.center,
    ));
  }
}
