import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addtaskscreen extends StatefulWidget {
  const Addtaskscreen({super.key});
  @override
  State<Addtaskscreen> createState() => _Addtaskscreen();
}

class _Addtaskscreen extends State<Addtaskscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            print('Menu tapped');
          },
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 30,
        title: Text(
          'Mindful Planner',
          style: TextStyle(
            color: Color.fromRGBO(148, 73, 49, 1),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://www.gettyimages.com/detail/photo/cold-day-at-the-beach-royalty-free-image/1161727825',
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 245, 243, 1),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(220, 220, 220, 1),
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.fact_check_outlined,
                      size: 40,
                      color: Color.fromRGBO(80, 100, 80, 1),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Confirm Tasks',
                  style: GoogleFonts.literata(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Review the tasks you just added.',
                  style: TextStyle(color: Color.fromRGBO(94, 78, 72, 1)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
