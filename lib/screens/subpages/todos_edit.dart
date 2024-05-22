import 'package:cooszy_pre/screens/components/cooszy_title.dart';
import 'package:cooszy_pre/themes/cooszy_icons.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ToDosEdit extends StatelessWidget {
  const ToDosEdit({super.key});

  @override
  Widget build(BuildContext context) {
    const editTitle = CooszyTitle(
      textStandard: "To-Do something with ",
      textStyled: "Joana",
      wrapNeeded: true,
    );

    return SizedBox(
      height: 600,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  editTitle,
                  //const Spacer(),
                  IconButton(
                    icon: Icon(Icons.close_outlined,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(CooszyIcons.to_do),
                        border: UnderlineInputBorder(),
                        labelText: 'What are you thinking of doing?',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 38.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            //labelText: 'Some description...',
                            hintText: 'Any additional idea here... (optional)'),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  // DATE PICKER
                  SfDateRangePicker(
                    view: DateRangePickerView.year,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
