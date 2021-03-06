import 'package:supabase/supabase.dart';

const supabaseUrl = '<Replace with your URL>';
const supabaseKey =
    '<Replace with your Key>';

class SupabaseManager {
  final client = SupabaseClient(supabaseUrl, supabaseKey);

  void signUpUser(String email, String password) async {
    await client.auth.signUp(email, password);
  }

  getData() async {
    var response = await client.from('datatable').select().execute();
    if (response.error == null) {
      print('response.data: ${response.data}');
    }
  }

  addData(String friendName) async {
    await client.from('datatable').insert([{'name': friendName}]).execute();
  }
}
