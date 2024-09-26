import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vita_valore/models/calendarioDiario.dart';

class CalendarioWidget extends StatefulWidget {
  final List<Item> items;

  const CalendarioWidget({super.key, required this.items});

  @override
  State<CalendarioWidget> createState() => _CalendarioWidgetState();
}

class _CalendarioWidgetState extends State<CalendarioWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 2.0,
        children: widget.items.map((item) {
          return Padding(
            padding: EdgeInsets.all(10.0.sp),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: item.color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  width: 80.w,
                  height: 25.h,
                  child: Center(
                    child: Text(
                      item.time,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 31, 31, 31),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  width: 80.w,
                  height: 55.h,
                  child: Center(
                    child: Text(
                      item.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
