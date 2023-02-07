import 'package:flutter/material.dart';

class BlocAccess extends StatefulWidget {
  const BlocAccess({Key? key}) : super(key: key);
  static const routeName = '/bloc_access';

  @override
  State<BlocAccess> createState() => _BlocAccessState();
}

class _BlocAccessState extends State<BlocAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '0',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
