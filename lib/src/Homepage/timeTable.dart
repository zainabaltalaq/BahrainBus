import 'package:flutter/material.dart';

void main() => runApp(const timeTable());

class timeTable extends StatelessWidget {
  const timeTable({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
         backgroundColor: const Color.fromARGB(255, 161, 13, 13),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 221, 128, 128),
          elevation: 0,
        ),
        body: const Steps(),
      ),
    );
  }
}

class Step {
  Step(this.title, this.body, this.body2, [this.isExpanded = false]);
  String title;
  String body;
  String body2;
  bool isExpanded;
}

Future<List<Step>> getSteps() async {
  var _items = [
    Step(
        'Bus15A Sunday-Saturday ',
        'Budaiya - Isa Town via Janabiyah - Al Jasra - Souq Waqif - Aali - Education Area \n \n Depart:              Arrive:  \n 9:30                   10.00 \n 11:10                12.00  \n 12:30                13.00\n 16:30                17.00 \n',
        ''),
    Step(
        'Bus15 Sunday-Saturday ',
        'Isa Town - Budaiya via Aali - Souq Waqif - Al Jasra - Janabiyah \n \n Depart:              Arrive:  \n 10:30                   10.00 \n 11:30                13.30  \n 14:30                15.30\n 16:30                17.30 \n',
        ''),
    Step(
        'Bus16 Sunday-Saturday ',
        'Zallaq - Isa Town   Isa Town - Zallaq \n \n Depart:              Arrive:  \n 10:30                   10.00 \n 11:30                13.30  \n 14:30                15.30\n 16:30                17.30 \n',
        ''),
  ];
  return Future<List<Step>>.delayed(const Duration(seconds: 2), () => _items);
}

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
        child: FutureBuilder<List<Step>>(
            future: getSteps(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Step>> snapshot) {
              if (snapshot.hasData) {
                return StepList(steps: snapshot.data ?? []);
              } else {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}

class StepList extends StatefulWidget {
  final List<Step> steps;
  const StepList({Key? key, required this.steps}) : super(key: key);
  @override
  State<StepList> createState() => _StepListState(steps: steps);
}

class _StepListState extends State<StepList> {
  final List<Step> _steps;
  _StepListState({required List<Step> steps}) : _steps = steps;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _steps[index].isExpanded = !isExpanded;
        });
      },
      children: _steps.map<ExpansionPanel>((Step step) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                step.title,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  fontFamily: 'hind',
                ),
              ),
            );
          },
          body: ListTile(
            title: Text(
              step.body,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                fontFamily: 'hind',
              ),
            ),
          ),
          isExpanded: step.isExpanded,
        );
      }).toList(),
    );
  }
}
