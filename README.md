
# Supabase - Flutter

Working with Supabase in Flutter! 

## What is Supabase?

Supabase is the Open Source Firebase Alternative. 
**Supabase** is a relational database whereas **Firebase** is a NoSQL database

## Getting Started

 - Add [dependency](https://pub.dev/packages/supabase)  `supabase: ^0.0.1-dev.9` to **pubspec.yaml** of your Flutter project.
 - Create a New Project on https://supabase.io/
 - Get the URL and Key by going to **Settings -> API** of your Supabase Project.
 
  **Create two variables:**
 - `const supabaseUrl = '<Replace with your URL>';`
 - `const supabaseKey = '<Replace with your Key>';`

**Initialise a `client` to perform operation.**

 - `final client = SupabaseClient(supabaseUrl, supabaseKey);`

## Authentication
The **LoginScreen** of the application has a simple button which when pressed signs up a user.

**Code for LoginScreen:**
```dart
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
                      await supabaseManager.signUpUser('email@gmail.com', 'password');  
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
```

**The `signUpUser` function is defined as:**
```dart
void signUpUser(String email, String password) async {  
  await client.auth.signUp(email, password);  
}
```
## Home Page
The HomePage has a simple UI with two buttons.
Read Button prints the data from table to console and Add Button adds data to table.

**Note**: Create a new table in database where the data will be stored. For this example I have made a table called `datatable`.

```dart
import 'package:flutter/material.dart';  
import 'package:supabase_flutter/supabase_manager.dart';  
  
class HomePage extends StatelessWidget {  
  SupabaseManager supabaseManager = SupabaseManager();  
  
   @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: SafeArea(  
        child: Container(  
          height: MediaQuery.of(context).size.height,  
          width: MediaQuery.of(context).size.width,  
          child: Column(  
            mainAxisAlignment: MainAxisAlignment.center,  
            crossAxisAlignment: CrossAxisAlignment.center,  
            children: [  
              RaisedButton(  
                onPressed: () async {  
                 await supabaseManager.getData();  
                 print('Got Data');  
                },  
                child: Text('Read Data'),  
              ),  
              RaisedButton(  
                onPressed: () async {  
                  await supabaseManager.addData('friendName');  
                  print('added data');  
                },  
                child: Text('Add Data'),  
              )  
            ],  
          ),  
        ),  
      ),  
    );  
  }  
}
```
## Reading Data
The `getData` function **reads data** from the table and prints to console:
```dart
  
getData() async {  
  var response = await client.from('datatable').select().execute();  
  if (response.error == null) {  
    print('response.data: ${response.data}');  
  }  
}
```

## Insert Data
The `addData` function **inserts data** into the table:
```dart
addData(String friendName) async {  
  await client.from('datatable').insert([{'name': friendName}]).execute();  
}
```
## Thank you :)

My knowledge of relational databases is limited but I'll continue working with Supabase and would love to see how it evolves. 
