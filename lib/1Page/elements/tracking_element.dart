import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Original Code ohne Mockmethode (nur mit API Pedometer)

class TrackingElement extends StatefulWidget {
  final void Function(String) onStepsChanged; // Callback-Funktion

  const TrackingElement({super.key, required this.onStepsChanged});

  @override
  State<TrackingElement> createState() => _TrackingElementState();
}

class _TrackingElementState extends State<TrackingElement> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  double _progress = 0;
  String _status = '?';
  String _steps = '?';
  late String goal = '';

  TextEditingController _controller = TextEditingController();

  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  Future<void> getUserData() async {
    final data = await docRef.get();
    final userData = data.data();
    setState(() {
      _steps = (userData!['steps'] ?? 0)
          .toString(); // Setze cloudSteps auf den Wert aus der Cloud oder 0, falls kein Wert vorhanden ist
      goal = (userData['goal'] ?? 500).toString();
    });
  }

  Future<void> updateUserSteps(int steps) async {
    await docRef.update({'steps': steps});
  }

  Future<void> updateUserGoal(String goal) async {
    await docRef.update({'goal': goal});
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    updateProgress();
    getUserData();
  }

  void updateProgress() {
    setState(() {
      try {
        _progress = double.parse(_steps) / double.parse(goal);
      } catch (e) {
        //print('Fehler beim Umwandeln des Strings in einen Double: $e');
        _progress = 0;
      }
    });
  }

  // Methoden für Pedometer
  void onStepCount(event) {
    setState(() {
      _steps = event.toString();
      updateProgress();
      updateUserSteps(int.parse(_steps));

      // Übergeben der Werte an die Callback-Funktion
      widget.onStepsChanged(_steps);
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    //print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    //print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    //print(_status);
  }

  void onStepCountError(error) {
    //print('onStepCountError: $error');
    setState(() {
      _steps = 'Sensor wird nicht erkannt';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        Icon(
          _status == 'walking'
              ? Icons.directions_run
              : _status == 'stopped'
                  ? Icons.accessibility_new
                  : Icons.error,
          size: 90,
          color: const Color.fromARGB(140, 255, 255, 255),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            value: _progress,
            backgroundColor: const Color.fromARGB(140, 255, 255, 255),
            color: const Color.fromARGB(255, 68, 118, 206),
            minHeight: 5,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // Zahlen
        const SizedBox(
          height: 10,
        ),
        //Zahlen
        Text(
          _steps,
          style: const TextStyle(
            color: Color.fromARGB(140, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "von",
              style: TextStyle(
                color: Color.fromARGB(140, 255, 255, 255),
                fontSize: 25,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 100,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    goal = value;
                    updateProgress();
                    updateUserGoal(value);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Schritte',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 16, 83, 199),
                  ),
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 68, 118, 206)),
                  ),
                ),
                style:
                    const TextStyle(color: Color.fromARGB(255, 68, 118, 206)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



//Code kopiert mit Mockmethode (ohne API) --> Der Code ist für Simulator geeignet
//Die Mockmethode simuliert den _stepCountStream (Ein Teil der Api) und lässt den SChrittzähler hochzählen
/*
//Mock Methode
Stream<int> pedometerMock(int start) async* {
  int currentNumber = start;
  while (true) {
    await Future.delayed(Duration(seconds: 1)); // Wait for 1 second
    yield currentNumber++;
  }
}

class TrackingElement extends StatefulWidget {
  final void Function(String) onStepsChanged; // Callback-Funktion

  const TrackingElement({super.key, required this.onStepsChanged});

  @override
  State<TrackingElement> createState() => _TrackingElementState();
}

class _TrackingElementState extends State<TrackingElement> {
  late Stream<int> _stepCountStream; //Mock Methode
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  double _progress = 0;
  String _status = '?';
  String _steps = '?';
  late String goal = '';

  TextEditingController _controller =
      TextEditingController(); 

  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  Future<void> getUserData() async {
    final data = await docRef.get();
    final userData = data.data();
    setState(() {
      _steps = (userData!['steps'] ?? 0).toString(); // Setze cloudSteps auf den Wert aus der Cloud oder 0, falls kein Wert vorhanden ist
      goal = (userData['goal'] ?? 500).toString();
    });
  }

  Future<void> updateUserSteps(int steps) async {
    await docRef.update({'steps': steps});
  }

  Future<void> updateUserGoal(String goal) async {
    await docRef.update({'goal': goal});
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    updateProgress();
    getUserData();
  }

  void updateProgress() {
    setState(() {
      try {
        _progress = double.parse(_steps) / double.parse(goal);
      } catch (e) {
        //print('Fehler beim Umwandeln des Strings in einen Double: $e');
        _progress = 0;
      }
    });
  }

  // Methoden für Pedometer
  void onStepCount(int event) {
    setState(() {
      _steps = event.toString();
      updateProgress();
      updateUserSteps(int.parse(_steps));

      // Übergeben der Werte an die Callback-Funktion
      widget.onStepsChanged(_steps);
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    //print(event);
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    //print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    //print(_status);
  }

  void onStepCountError(error) {
    //print('onStepCountError: $error');
    setState(() {
      _steps = 'Sensor wird nicht erkannt';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = pedometerMock(0); //Mock Methode
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        Icon(
          _status == 'walking'
              ? Icons.directions_run
              : _status == 'stopped'
                  ? Icons.accessibility_new
                  : Icons.error,
          size: 90,
          color: const Color.fromARGB(140, 255, 255, 255),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            value: _progress,
            backgroundColor: const Color.fromARGB(140, 255, 255, 255),
            color: const Color.fromARGB(255, 68, 118, 206),
            minHeight: 5,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        // Zahlen
        const SizedBox(
          height: 10,
        ),
        //Zahlen
        Text(
          _steps,
          style: const TextStyle(
            color: Color.fromARGB(140, 255, 255, 255),
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "von",
              style: TextStyle(
                color: Color.fromARGB(140, 255, 255, 255),
                fontSize: 25,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            SizedBox(
              width: 100,
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    goal = value;
                    updateProgress();
                    updateUserGoal(value);
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Schritte',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 16, 83, 199),
                  ),
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 68, 118, 206)),
                  ),
                ),
                style:
                    const TextStyle(color: Color.fromARGB(255, 68, 118, 206)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
*/