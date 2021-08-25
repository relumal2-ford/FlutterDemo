// Flutter code sample for Card
//
// This sample shows creation of a [Card] widget that shows album information
// and two actions.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_first_flutter/CustomerConsentViewModel.dart';
import 'package:provider/provider.dart';
import 'RadioButtonWidget.dart';


/// This is the main application widget.
class CustomerConsentScreen extends StatelessWidget {
  const CustomerConsentScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MySampleScreen();
  }
}

class MySampleScreen extends StatelessWidget {
  CustomerConsentViewModel? customerConsentViewModel;

  Widget _netWorkCard() {
    if (customerConsentViewModel?.networkStatus == null) {
      return Padding(padding: EdgeInsets.zero);
    } else {
      return customerConsentViewModel!.networkStatus! ?
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Online Consent',style: const TextStyle(color: Colors.blue, fontSize: 18),),
            ),
            Divider(),
            Padding(padding: EdgeInsets.all(7.0)),
            Text("Click Below Button To Send the LInk To Customer",style: const TextStyle(color: Colors.grey, fontSize: 14),),
            Padding(padding: EdgeInsets.all(6.0)),
            Center(
              child: ElevatedButton(
                child: Text("SEND LINK"),
                onPressed: (){},
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0)),
          ],

        ),

      ) :
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Offline Consent',style: const TextStyle(color: Colors.blue, fontSize: 18),),
            ),
            Divider(),
            Padding(padding: EdgeInsets.all(7.0)),
            Text("Upload Customer Signed Consent Form",style: const TextStyle(color: Colors.grey, fontSize: 14),),
            Padding(padding: EdgeInsets.all(8.0)),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        width: 1, color: Colors.purple, style: BorderStyle.solid)),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: '',
                      contentPadding: EdgeInsets.all(15),
                      border: InputBorder.none),
                  onChanged: (value) {},
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(6.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)
                      ),
                      primary: Colors.red
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text("Attach"),
                      const SizedBox(width: 10),
                      Icon(Icons.attach_file )
                    ],
                  ),
                ),
                // const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)
                        ),
                        primary: Colors.red
                    ),

                    child: Icon(CupertinoIcons.camera)
                ),
                const SizedBox(width: 10),
                // Spacer(),
                ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      primary: Colors.blue
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Upload",),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(6.0)),

          ],

        ),
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 15),
        child: Column(children: [
          ChangeNotifierProvider(
            create: (_) => CustomerConsentViewModel(),
            builder: (ctx, provider) {
              customerConsentViewModel = Provider.of<CustomerConsentViewModel>(ctx);
              return getBody(context);
            },
          ),
        ],)
    );
  }

  Widget getBody(BuildContext context) {

    return Column(children: [
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Select Consent Type',style: const TextStyle(color: Colors.blue, fontSize: 18),),
            ),
            Divider(),
             radioButtonList(context),
          ],
        ),
      ),
      Padding(padding: EdgeInsets.all(3.0),
      ),
      _netWorkCard(),
    ],
    );
  }

  Widget radioButtonList(BuildContext  context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyRadioOption<String>(
          value: 'A',
          groupValue: customerConsentViewModel!.groupValue,
          onChanged: customerConsentViewModel!.setSelectedButton,
          label: 'A',
          text: 'Online',
        ),
        MyRadioOption<String>(
          value: 'B',
          groupValue: customerConsentViewModel!.groupValue,
          onChanged: customerConsentViewModel!.setSelectedButton,
          label: 'B',
          text: 'Offline',
        ),

      ],
    );
  }

}