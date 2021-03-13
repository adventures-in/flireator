// Imports the Flutter Driver API.
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final buttonFinder = find.byType('AppleSignInButton');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      if (const bool.fromEnvironment('EMULATORS')) {
        WidgetsFlutterBinding.ensureInitialized();
        await Firestore.instance.settings(
          host: 'localhost:8080',
          sslEnabled: false,
          persistenceEnabled: false,
        );
      }
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        // driver.close();
      }
    });

    test('sign in', () async {
      await driver.tap(buttonFinder);
    });

    // test('starts at 0', () async {
    //   // Use the `driver.getText` method to verify the counter starts at 0.
    //   expect(await driver.getText(counterTextFinder), "0");
    // });

    // test('increments the counter', () async {
    //   // First, tap the button.
    //   await driver.tap(buttonFinder);

    //   // Then, verify the counter text is incremented by 1.
    //   expect(await driver.getText(counterTextFinder), "1");
    // });
  });
}
