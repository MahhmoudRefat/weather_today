import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
 // TextEditingController controller ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("search City"),
      ),
      body:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
           // controller: ,
            onSubmitted: (value){
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)),
              contentPadding: EdgeInsets.symmetric(vertical: 32,horizontal: 15),
              label: Text("search"),
              hintText: "Enter City name ",
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
