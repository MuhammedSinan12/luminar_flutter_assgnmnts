import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List cards = [
    [
      const Icon(
        Icons.bed_outlined,
        color: Colors.white,
        size: 26,
      ),
      'Hotel',
      Colors.pink,
    ],
    [
      const Icon(
        Icons.restaurant,
        color: Colors.white,
        size: 26,
      ),
      'Restaurant',
      Colors.blue,
    ],
    [
      const Icon(
        Icons.coffee_rounded,
        color: Colors.white,
        size: 26,
      ),
      'Cafe',
      Colors.orange
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
        ],
        bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 100),
            child: Column(
              children: [
                const Text(
                  'Type Your Location',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 15, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          hintText: 'Kochi',
                          prefixIcon: const Icon(Icons.search_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  const BorderSide(color: Colors.white))),
                    ),
                  ),
                )
              ],
            )),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue[200],
        elevation: 0,
      ),
      body: Column(
        children: [Categories(cards: cards), const HotelScreen()],
      ),
    );
  }
}

class HotelScreen extends StatelessWidget {
  const HotelScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          height: 350,
          child: Column(children: [
            Container(
              height: 200,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8aG90ZWwlMjByb29tfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"))),
              child: Stack(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.star_border_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 40,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Center(
                        child: Text(
                          '\$40',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Room in Kochi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  const Text(
                    "Kerala,India",
                    style: TextStyle(fontSize: 17),
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.green,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('(300 reviews)')
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({super.key, required this.cards});

  final List cards;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, left: 25, right: 25, bottom: 10),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: cards.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: 95, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cards[index][2],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cards[index][0],
                const SizedBox(
                  height: 10,
                ),
                Text(
                  cards[index][1],
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    ),
  );
}
