import 'package:flutter/material.dart';

void main() => runApp(const faq());

class faq extends StatelessWidget {
  const faq({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 151, 20, 20),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const Steps(),
      ),
    );
  }
}

class Step {
  Step(this.title, this.body, [this.isExpanded = false]);
  String title;
  String body;
  bool isExpanded;
}

Future<List<Step>> getSteps() async {
  var _items = [
    Step('What is the new fare structure?',
        'The new fare will be 300Fils for the single paper ticket and 275Fils for the single ticket in the GO Card for all passengers for any single trip, no matter how long it is, and 700 Fils for DAILY CAP.'),
    Step('What are the types of fares available?',
        'Fares are: Single paper ticket 300Fils, 275Fils for the single ticket in the GO Card,  DayPass 700 Fils. Unlimited trips in the same day and Monthly Pass for 12 BD, unlimited trips during 28 days, only available in GO Card .'),
    Step('Where can I find more information on the new routes?',
        'All information on bus routes is available on our website under the Routes tab.'),
    Step(
        'Is there a special route that goes to Bahrain International Airport? ',
        'Yes, the airport express service Airlink is serviced by the A1 and A2 and operates from the BIA terminal to Manama every 15 minutes.'),
    Step('Are the new buses easily accessible for wheelchair users?',
        'All 141 buses have been designed to accommodate wheelchairs and passengers with restricted mobility issues. All buses can accommodate 1 person using a wheelchair. Wheelchair users have priority over everyone else for use of the wheelchair space. The buses are low-floor vehicles and every bus has a driver operated ramp to enable all passengers, including people using wheelchairs, people with baby strollers, and people with restricted mobility get on and off easily.'),
    Step('Are there any discounts for seniors or people with special needs?',
        'Yes, please see below for more information: Elderly citizens Can visit a retail office at one of our bus terminals to purchase a GO-Card which will cost 500 fils. This will enable travel for 138 fils per trip. The maximum amount that will be charged is 350 fils per day, there is no limit to the number of trips that can be made. To be eligible for the discounted travel the elderly citizen must provide their name and address and present a valid elderly card issued by the Ministry of Labour and Social Development, which will be scanned along with the persons CPR. Special Needs citizens Can visit a retail office at one of our bus terminals to purchase a GO-Card which will cost 500 fils. This will enable free travel anytime. There is no limit to the number of trips that can be made. To be eligible for the discounted travel the special needs citizen must provide their name and address and present a valid Bahrain nationality CPR with the relevant icon to indicate they are disabled, which will be scanned.'),
    Step('Are there any discounts for students and children?',
        'Not at present, we are working with the MTT and may introduce some discount schemes in the future. Users of these discounts will need a personalised GO Card and proof of compliance to obtain any such discount.'),
  ];
  return Future<List<Step>>.delayed(const Duration(seconds: 2), () => _items);
}

class Steps extends StatelessWidget {
  const Steps({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 90, left: 10, right: 10),
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
