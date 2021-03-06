import 'package:flutter/material.dart';
import 'package:supabase_flutter/homepage.dart';
import 'package:supabase_flutter/supabase_manager.dart';

class LoginScreen extends StatelessWidget {
  SupabaseManager supabaseManager = SupabaseManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(50),
            child: Align(
                alignment: Alignment.center,
                child: FlatButton(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: ()  async {
                      await supabaseManager.signUpUser('adityathakurxd@gmail.com', 'qwerty1234');
                      print('Signed Up');
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    },
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.account_circle, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                                'Sign into to Supabase',
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                    )
                )
            )
        )
    );
  }
}
