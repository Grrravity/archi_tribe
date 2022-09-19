// ignore: unused_import
import 'dart:convert';

// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'package:sqfentity/sqfentity.dart';
import 'package:sqfentity_gen/sqfentity_gen.dart';

import 'Tables/todo_table.dart';

part 'database.g.dart';

@SqfEntityBuilder(archiDb)
const archiDb = SqfEntityModel(
  modelName: "ArchiDb",
  databaseName: "ArchiDb.db",
  password: "ArchiDb",
  databaseTables: [tableTodo],
  defaultColumns: [
    SqfEntityField('created_at', DbType.datetime,
        defaultValue: 'DateTime.now()'),
    SqfEntityField('updated_at', DbType.datetime),
  ],
  preSaveAction: getPreSaveAction,
);

Future<TableBase> getPreSaveAction(String tableName, obj) async {
  //NOTE Gère les champs autos au moment de save / update
  obj.created_at ??= DateTime.now();
  obj.updated_at = DateTime.now();
  return obj;
}

//SECTION Gestion des dates
/// Specify a defaultDateFormat (Optional) default (dd-MM-yyyy)
final defaultDateFormat = intl.DateFormat('dd-MMMM-yyyy');

/// Specify a defaultTimeFormat (Optional) default (hh:mm a)
final defaultTimeFormat = intl.DateFormat('hh:mm a');

/// Specify a defaultDateTimeFormat (Optional) default (dd-MM-yyyy - hh:mm a)
final defaultDateTimeFormat =
    intl.DateFormat('$defaultDateFormat - $defaultTimeFormat');

DateTime toDateTime(TimeOfDay x) {
  return DateTime(2020, 1, 1, x.hour, x.minute);
}

TimeOfDay? tryParseTime(String x) {
  final DateTime? d = tryParseTimeToDate(x);
  return d == null ? null : TimeOfDay.fromDateTime(d);
}

DateTime? tryParseTimeToDate(String x) {
  try {
    return int.tryParse(x) != null
        ? DateTime.fromMillisecondsSinceEpoch(int.tryParse(x)!)
        : defaultTimeFormat.parse(x);
  } catch (e) {
    return tryParseDateTime(x);
  }
}

DateTime? tryParseDate(String x) {
  try {
    return defaultDateFormat.parse(x);
  } catch (e) {
    return tryParseDateTime(x);
  }
}

DateTime? tryParseDateTime(String x) {
  try {
    return defaultDateTimeFormat.parse(x);
  } catch (e) {
    return DateTime.tryParse(x);
  }
}
//!SECTION
