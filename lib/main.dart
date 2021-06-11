import 'package:flutter/material.dart';
import 'package:flutter_task/helper/size_config.dart';
import 'package:flutter_task/model/data_modle.dart';
import 'package:flutter_task/repo/database_helper.dart';
import 'package:flutter_task/view/widgets/app_indicator.dart';
import 'package:flutter_task/view/widgets/common_text_controller.dart';
import 'package:flutter_task/view/widgets/custome_button.dart';
import 'package:flutter_task/view/widgets/custome_text.dart';
import 'package:flutter_task/view/widgets/dropDownList.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper.db.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'Kalasko Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      );
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController? kayTextController = TextEditingController();

  final TextEditingController? valueTextController = TextEditingController();

  final GlobalKey<FormFieldState> keyFieldKey = GlobalKey();

  final GlobalKey<FormFieldState> valueFieldKey = GlobalKey();

  Rx<DataModel>? selectedDataModel;

  void onDropValueChanged(value) {
    selectedDataModel = Rx(value);

    /// Just to be ensure the UI has been updated
    Get.appUpdate();
  }

  void validateFields(Function? dataBaseAction) {
    keyFieldKey.currentState?.validate();
    valueFieldKey.currentState?.validate();

    if (!keyFieldKey.currentState!.isValid &&
        !keyFieldKey.currentState!.isValid)
      return;
    else{
      /// assigning a value to the [selectedDataModel]
      selectedDataModel = Rx(DataModel(value: valueTextController!.text, key: kayTextController!.text));


      Future.delayed(Duration.zero, () => dataBaseAction);
    }
  }

  insertToDataBase() {
    if (selectedDataModel != null) {
      if (selectedDataModel?.value != null)
        DatabaseHelper.db.inset(selectedDataModel?.value);
    }
  }

  updateDataBaseRecord() {
    if (selectedDataModel != null) {
      if (selectedDataModel?.value != null)
        DatabaseHelper.db.updateRecord(selectedDataModel?.value);
    }
  }

  deleteDataBaseRecord() {
    if (selectedDataModel != null) {
      if (selectedDataModel?.value != null)
        DatabaseHelper.db.deleteRecord(selectedDataModel?.value.key);
    }
  }

  @override
  void initState() {
    DatabaseHelper.db.getAllRecords();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    SizeConfig().init(Get.context!);


    return Scaffold(
        body: Obx(
          () => DatabaseHelper.db.isGettingAllRecords.value
              ? ApplicationIndicator()
              : Container(
            height: SizeConfig().safeBlockVertical! * 100,
            width: SizeConfig().safeBlockHorizontal! * 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// acting as an app bar, but its just a title!
                CostumeText(
                    fontSize: SizeConfig().fontSize22,
                    text: 'Kalasko Task',
                    color: Colors.green),
                // CostumeText(fontSize: SizeConfig().fontSize12, text: 'Kalasko Task', color: Colors.green, maxLine:, height: ),

                /// list all keys available in app in-memory datastore
                DatabaseHelper.db.allRecords.isEmpty ? CostumeText(
                    fontSize: SizeConfig().fontSize12,
                    text: 'There is not data',
                    color: Colors.red) : DropDownList(
                  items: DatabaseHelper.db.allRecords,
                  hint: 'Select a Key',
                  onChange: onDropValueChanged,
                ),

                /// an input field for the user custom record key
                CommonTextControllers().customTextField(
                    maxLines: 1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Key can not be empty!';
                      } else
                        return null;
                    },
                    labelText: 'Key',
                    height: SizeConfig().safeBlockVertical! * 7,
                    width: SizeConfig().safeBlockHorizontal! * 100,
                    controller: kayTextController,
                    formKey: keyFieldKey,
                    isObscureText: false,
                    keyboardType: TextInputType.text,
                    fontColor: Colors.black,
                    textFieldColor: Colors.purple,
                    borderColor: Colors.grey,
                    fillColor: Colors.white),

                /// an input field for the user custom record Value
                CommonTextControllers().customTextField(
                    maxLines: 1,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Value can not be empty!';
                      } else
                        return null;
                    },
                    labelText: 'Value',
                    height: SizeConfig().safeBlockVertical! * 7,
                    width: SizeConfig().safeBlockHorizontal! * 100,
                    controller: valueTextController,
                    formKey: valueFieldKey,
                    isObscureText: false,
                    keyboardType: TextInputType.text,
                    fontColor: Colors.black,
                    textFieldColor: Colors.purple,
                    borderColor: Colors.grey,
                    fillColor: Colors.white),

                Wrap(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                          SizeConfig().safeBlockHorizontal! * 5),
                      width: SizeConfig().screenWidth! * .5,
                      height: SizeConfig().screenWidth! * .25,
                      child: CustomButton(
                        color: Colors.green,
                        onPress: () => validateFields(insertToDataBase()),
                        text: 'Insert',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          SizeConfig().safeBlockHorizontal! * 5),
                      width: SizeConfig().screenWidth! * .5,
                      height: SizeConfig().screenWidth! * .25,
                      child: CustomButton(
                        color: Colors.green,
                        onPress: () =>
                            validateFields(updateDataBaseRecord()),
                        text: 'Update',
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          SizeConfig().safeBlockHorizontal! * 5),
                      width: SizeConfig().screenWidth! * .5,
                      height: SizeConfig().screenWidth! * .25,
                      child: CustomButton(
                        color: Colors.green,
                        onPress: () =>
                            validateFields(deleteDataBaseRecord()),
                        text: 'Delete',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}
