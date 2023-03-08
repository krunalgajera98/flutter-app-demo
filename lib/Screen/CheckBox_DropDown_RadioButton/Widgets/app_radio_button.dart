import 'package:flutter/material.dart';

class AppRadioButton extends StatelessWidget {
  List list;
  String selectedItem;
  String title;
  void Function(String?)? onChanged;

  AppRadioButton({required this.title, this.onChanged, required this.list, required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                selectedItem = list[index];
                onChanged?.call(selectedItem);
              },
              child: Container(
                color: Colors.transparent, // don't remove, this can help to cover more area for touch
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                      // IgnorePointer: this will help to disable RadioButton onTap
                      child: IgnorePointer(
                        child: Radio<String>(
                          activeColor: Colors.purple,
                          value: list[index],
                          groupValue: selectedItem,
                          onChanged: (String? value) {},
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(list[index]),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
