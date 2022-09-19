import 'package:sqfentity_gen/sqfentity_gen.dart';

const tableTodo = SqfEntityTable(
  tableName: "todo",
  modelName: "TodoTable",
  primaryKeyName: "id",
  primaryKeyType: PrimaryKeyType.integer_auto_incremental,
  fields: [
    SqfEntityField(
      "title",
      DbType.text,
      isNotNull: true,
    ),
    SqfEntityField("description", DbType.text),
    SqfEntityField("is_done", DbType.bool,
        isNotNull: true, defaultValue: false),
  ],
  useSoftDeleting: true,
  customCode: '''
    Future<int?> empty() async {
      int? result = await TodoTable(
          title: "Sample Task",
          description: "Sample desc",
          )
        .save();
      return result;
    }
    ''',
);
