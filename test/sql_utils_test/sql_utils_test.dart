import 'package:flutter_test/flutter_test.dart';
import 'package:insta_demo_app/core/local_data_helper/sqlflite_database/sql_utils.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Setup sqflite_common_ffi for flutter test
  setUpAll(() {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory for unit testing calls for SQFlite
    databaseFactory = databaseFactoryFfi;
  });


  group('SqliteUtils', () {

    tearDown(() async => await SqliteUtils.deleteDB());

    test('Create and query table', () async {
      // Insert sample data
      await SqliteUtils.insertData(
        TableName.clients.name,
        {
          'name': 'John Doe',
          'phone': '555-1234',
          'address': '123 Main St',
          'notes': 'Some notes',
        },
      );

      // Query data
      final result = await SqliteUtils.fetchData(TableName.clients.name);

      expect(result, isNotEmpty);
      expect(result.first['name'], 'John Doe');
    });
    test('Fetch data by ID', () async {

      await SqliteUtils.insertData(
        TableName.clients.name,
        {
          'name': 'Jane Doe',
          'phone': '555-5678',
          'address': '456 Oak St',
          'notes': 'Other notes',
        },
      );

      // Query data by ID
      const id = 1;
      final result = await SqliteUtils.fetchDataById(TableName.clients.name, id);

      expect(result, isNotNull);
      expect(result!['name'], 'Jane Doe');
    });


    test('Update data', () async {
      // Insert sample data
      await SqliteUtils.insertData(
        TableName.clients.name,
        {
          'name': 'Old Name',
          'phone': '555-0000',
        },
      );

      // Update data
      final id = 1;
      final updatedData = {'name': 'New Name'};
      final updateResult =
          await SqliteUtils.updateData(TableName.clients.name, id, updatedData);

      expect(updateResult, true);

      // Verify the updated data
      final result = await SqliteUtils.fetchDataById(TableName.clients.name, id);
      expect(result!['name'], 'New Name');
    });


    test('Delete data', () async {
      // Insert sample data
      await SqliteUtils.insertData(
        TableName.clients.name,
        {
          'name': 'To be deleted',
          'phone': '555-9999',
        },
      );

      // Delete data
      final id = 1;
      final deleteResult =
          await SqliteUtils.deleteData(TableName.clients.name, id);

      expect(deleteResult, true);

      // Verify that the data has been deleted
      final result = await SqliteUtils.fetchDataById(TableName.clients.name, id);
      expect(result, isNull);
    });

    test('Delete database', () async {
      // Insert sample data
      await SqliteUtils.insertData(
        TableName.clients.name,
        {
          'name': 'John Doe',
          'phone': '555-1234',
        },
      );

      // Verify that data exists
      final resultBeforeDeletion =
          await SqliteUtils.fetchData(TableName.clients.name);
      expect(resultBeforeDeletion, isNotEmpty);

      // Delete the database
      await SqliteUtils.deleteDB();

      // Verify that the database has been deleted
      final resultAfterDeletion =
          await SqliteUtils.fetchData(TableName.clients.name);
      expect(resultAfterDeletion, isEmpty);
    });
  });
}
