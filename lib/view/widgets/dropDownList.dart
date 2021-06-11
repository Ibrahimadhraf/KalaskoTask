import 'package:flutter/material.dart';
import 'package:flutter_task/model/data_modle.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DropDownList extends StatefulWidget {
  final onChange;
  RxList<DataModel>? items = RxList();
  final hint;
  DropDownList({Key? key, this.onChange, this.items, this.hint})
      : super(key: key);
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  var val;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height < 700
          ? MediaQuery.of(context).size.height * 0.08
          : MediaQuery.of(context).size.height > 700 &&
                  MediaQuery.of(context).size.height < 810
              ? MediaQuery.of(context).size.height * 0.06
              : MediaQuery.of(context).size.height * 0.043,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Color(0xFFbbbbbb),
            width: 1.2,
            style: BorderStyle.solid,
          )),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          //itemHeight: 20,
          value: val,
          hint: Text(
            widget.hint,
            style: TextStyle(
                fontFamily: "Montserrat-Medium",
                color: Color(0xFF707070),
                fontSize: MediaQuery.of(context).size.height * .02,
                fontWeight: FontWeight.w400),
          ),
          items: List.generate(
              widget.items!.length,
              (index) => DropdownMenuItem(
                    value: widget.items![index],
                    child: Text(
                      '${widget.items![index].key}',
                      style: TextStyle(
                          fontFamily: "Montserrat-Medium",
                          color: Color(0xFF707070),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    ),
                  )),
          onChanged: (value) {
            setState(() {
              val = value;
            });
            widget.onChange(value);
          },
          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down_circle_outlined,
            color: Color(0xFF707070),
            size: 20.0,
          ),
          //iconSize: 15,
        ),
      ),
    );
  }
}
