import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

class SuccessfullScreen extends StatelessWidget {
  const SuccessfullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              const Text(
                "Successful checkout",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar.builder(
                    initialRating: 4.5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 40,
                    itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber), 
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "4.5",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 500,
                child: TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: "Please enter your rating statement",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () { context.go('/home/0'); },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
