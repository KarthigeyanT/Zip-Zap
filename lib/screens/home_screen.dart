import 'dart:math' show Random, min;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_commerce_app/utils/cart_manager.dart';
import 'package:quick_commerce_app/models/product.dart';
import 'package:quick_commerce_app/theme/theme.dart';
import 'package:quick_commerce_app/screens/explore_screen.dart';
import 'package:quick_commerce_app/screens/cart_screen.dart';
import 'package:quick_commerce_app/screens/profile_screen.dart';
import 'package:quick_commerce_app/screens/product_display.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Widget screen;
    switch (index) {
      case 0:
        screen = const HomeScreen();
        break;
      case 1:
        screen = const ExploreScreen(initialCategory: 'All');
        break;
      case 2:
        screen = const ProfileScreen();
        break;
      default:
        screen = const HomeScreen();
    }

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => screen,
        transitionDuration: const Duration(milliseconds: 300),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreenContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
        unselectedLabelStyle: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
          letterSpacing: -0.5,
        ),
        backgroundColor: AppTheme.lightTheme.colorScheme.surface,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          size: 24,
          color: AppTheme.primaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          size: 22,
          color: Colors.grey,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  _HomeScreenContentState createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  final List<String> bannerImages = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];

  final List<Product> products = [
    Product(
      id: 'GOD_OF_WAR_RAGNAROK_ps5',
      name: 'God of War Ragnarok PS5', 
      price: 4999.0, 
      image: 'God of War Ragnarok PS5',
      imagePath: 'assets/images/GOD_OF_WAR_RAGNAROK_ps5.png'
    ),
    Product(
      id: 'GTA_6_ps5',
      name: 'GTA 6 PS5', 
      price: 5499.0, 
      image: 'GTA 6 PS5',
      imagePath: 'assets/images/GTA_6_ps5.png'
    ),
    Product(
      id: 'JBL_Bluetooth_Headset',
      name: 'JBL Bluetooth Headset', 
      price: 2999.0, 
      image: 'JBL Bluetooth Headset',
      imagePath: 'assets/images/JBL_Bluetooth_Headset.png'
    ),
    Product(
      id: 'boAt_Earphones_Bassheads_225',
      name: 'BoAt Earphones (Bassheads 225)', 
      price: 1299.0, 
      image: 'BoAt Earphones (Bassheads 225)',
      imagePath: 'assets/images/boAt_Earphones_Bassheads_225.png'
    ),
    Product(
      id: 'Mi_Power_Bank',
      name: 'Mi Power Bank', 
      price: 799.0, 
      image: 'Mi Power Bank',
      imagePath: 'assets/images/Mi_Power_Bank.png'
    ),
    Product(
      id: 'HP_ink_cartridges',
      name: 'HP Ink Cartridges', 
      price: 1499.0, 
      image: 'HP Ink Cartridges',
      imagePath: 'assets/images/HP_ink_cartridges.png'
    ),
    Product(
      id: 'Samsung_Type-C_charger',
      name: 'Samsung Type-C Charger', 
      price: 499.0, 
      image: 'Samsung Type-C Charger',
      imagePath: 'assets/images/Samsung_Type-C_charger.png'
    ),
    Product(
      id: 'X_BOX_ONE',
      name: 'X-BOX ONE', 
      price: 19999.0, 
      image: 'X-BOX ONE',
      imagePath: 'assets/images/X_BOX_ONE.png'
    ),
    Product(
      id: 'Jumanji_game_xbox',
      name: 'Jumanji Game Xbox', 
      price: 2499.0, 
      image: 'Jumanji Game Xbox',
      imagePath: 'assets/images/Jumanji_game_xbox.png'
    ),
    Product(
      id: 'The_CREW_2_xbox',
      name: 'The Crew 2 Xbox', 
      price: 3499.0, 
      image: 'The Crew 2 Xbox',
      imagePath: 'assets/images/The_CREW_2_xbox.png'
    ),
    Product(
      id: 'RED_DEAD_REDEMPTION_2_ps4',
      name: 'Red Dead Redemption 2 PS4', 
      price: 4499.0, 
      image: 'Red Dead Redemption 2 PS4',
      imagePath: 'assets/images/RED_DEAD_REDEMPTION_2_ps4.png'
    ),
    Product(
      id: 'apple',
      name: 'Apple', 
      price: 99.0, 
      image: 'Apple',
      imagePath: 'assets/images/apple.png'
    ),
    Product(
      id: 'banana',
      name: 'Banana', 
      price: 49.0, 
      image: 'Banana',
      imagePath: 'assets/images/banana.png'
    ),
    Product(
      id: 'amul_butter',
      name: 'Amul Butter', 
      price: 199.0, 
      image: 'Amul Butter',
      imagePath: 'assets/images/amul_butter.png'
    ),
    Product(
      id: 'amul_cheese',
      name: 'Amul Cheese', 
      price: 249.0, 
      image: 'Amul Cheese',
      imagePath: 'assets/images/amul_cheese.png'
    ),
    Product(
      id: 'amul_ghee_1l',
      name: 'Amul Ghee (1L)', 
      price: 399.0, 
      image: 'Amul Ghee (1L)',
      imagePath: 'assets/images/amul_ghee_1l.png'
    ),
    Product(
      id: 'aavin_milk_500ml',
      name: 'Aavin Milk (500ml)', 
      price: 49.0, 
      image: 'Aavin Milk (500ml)',
      imagePath: 'assets/images/aavin_milk_500ml.png'
    ),
    Product(
      id: 'Diarymilk_silk_special',
      name: 'Dairy Milk Silk Special', 
      price: 99.0, 
      image: 'Dairy Milk Silk Special',
      imagePath: 'assets/images/Diarymilk_silk_special.png'
    ),
    Product(
      id: 'amul_family_pack_vailla',
      name: 'Amul Family Pack Vanilla', 
      price: 199.0, 
      image: 'Amul Family Pack Vanilla',
      imagePath: 'assets/images/amul_family_pack_vailla.png'
    ),
    Product(
      id: 'britania_cheese_slice',
      name: 'Britannia Cheese Slice', 
      price: 99.0, 
      image: 'Britannia Cheese Slice',
      imagePath: 'assets/images/britania_cheese_slice.png'
    ),
    Product(
      id: 'chicken_1kg',
      name: 'Chicken (1kg)', 
      price: 249.0, 
      image: 'Chicken (1kg)',
      imagePath: 'assets/images/chicken_1kg.png'
    ),
    Product(
      id: 'dried_prawns',
      name: 'Dried Prawns', 
      price: 399.0, 
      image: 'Dried Prawns',
      imagePath: 'assets/images/dried_prawns.png'
    ),
    Product(
      id: 'Bajaj_kettle',
      name: 'Bajaj Kettle', 
      price: 999.0, 
      image: 'Bajaj Kettle',
      imagePath: 'assets/images/Bajaj_kettle.png'
    ),
    Product(
      id: 'Philips_Mixer_Grinder',
      name: 'Philips Mixer Grinder', 
      price: 1999.0, 
      image: 'Philips Mixer Grinder',
      imagePath: 'assets/images/Philips_Mixer_Grinder.png'
    ),
    Product(
      id: 'Milton_jar_pack_of_18',
      name: 'Milton Jar (Pack of 18)', 
      price: 499.0, 
      image: 'Milton Jar (Pack of 18)',
      imagePath: 'assets/images/Milton_jar_pack_of_18.png'
    ),
    Product(
      id: 'borosil_water_bottle',
      name: 'Borosil Water Bottle', 
      price: 399.0, 
      image: 'Borosil Water Bottle',
      imagePath: 'assets/images/borosil_water_bottle.png'
    ),
    Product(
      id: 'colgate_paste',
      name: 'Colgate Paste', 
      price: 99.0, 
      image: 'Colgate Paste',
      imagePath: 'assets/images/colgate_paste.png'
    ),
    Product(
      id: 'dove_soap',
      name: 'Dove Soap', 
      price: 99.0, 
      image: 'Dove Soap',
      imagePath: 'assets/images/dove_soap.png'
    ),
    Product(
      id: 'band_aid',
      name: 'Band-Aid', 
      price: 49.0, 
      image: 'Band-Aid',
      imagePath: 'assets/images/band_aid.png'
    ),
    Product(
      id: 'gillette_mach_3',
      name: 'Gillette Mach 3', 
      price: 199.0, 
      image: 'Gillette Mach 3',
      imagePath: 'assets/images/gillette_mach_3.png'
    ),
    Product(
      id: 'detol_antiseptic_liquid',
      name: 'Dettol Antiseptic Liquid', 
      price: 99.0, 
      image: 'Dettol Antiseptic Liquid',
      imagePath: 'assets/images/detol_antiseptic_liquid.png'
    ),
    Product(
      id: 'creatine_monohydrate',
      name: 'Creatine Monohydrate', 
      price: 999.0, 
      image: 'Creatine Monohydrate',
      imagePath: 'assets/images/creatine_monohydrate.png'
    ),
    Product(
      id: 'haldiram_bhujia_sev',
      name: 'Haldiram\'s Bhujia Sev', 
      price: 99.0, 
      image: 'Haldiram\'s Bhujia Sev',
      imagePath: 'assets/images/haldiram\'s_bhujia_sev.png'
    ),
    Product(
      id: 'cup_noodles_mazedaar_masala',
      name: 'Cup Noodles Mazedaar Masala', 
      price: 49.0, 
      image: 'Cup Noodles Mazedaar Masala',
      imagePath: 'assets/images/cup_noodles_mazedaar_masala.png'
    ),
    Product(
      id: 'cornotto_cone_chocolate',
      name: 'Cornetto Cone Chocolate', 
      price: 99.0, 
      image: 'Cornetto Cone Chocolate',
      imagePath: 'assets/images/cornotto_cone_chocolate.png'
    ),
    Product(
      id: 'ferraro_rocher_24piece',
      name: 'Ferrero Rocher (24 piece)', 
      price: 499.0, 
      image: 'Ferrero Rocher (24 piece)',
      imagePath: 'assets/images/ferraro_rocher_24piece.png'
    ),
    Product(
      id: 'cocacola_500ml',
      name: 'Coca-Cola (500ml)', 
      price: 49.0, 
      image: 'Coca-Cola (500ml)',
      imagePath: 'assets/images/cocacola_500ml.png'
    ),
    Product(
      id: 'fortune_sunflower_oil_1l',
      name: 'Fortune Sunflower Oil (1L)', 
      price: 199.0, 
      image: 'Fortune Sunflower Oil (1L)',
      imagePath: 'assets/images/fortune_sunflower_oil_1l.png'
    ),
    Product(
      id: 'everest_turmeric',
      name: 'Everest Turmeric', 
      price: 99.0, 
      image: 'Everest Turmeric',
      imagePath: 'assets/images/everest_turmeric.png'
    ),
    Product(
      id: 'ashirvad_atta_1kg',
      name: 'Ashirvad Atta (1kg)', 
      price: 99.0, 
      image: 'Ashirvad Atta (1kg)',
      imagePath: 'assets/images/ashirvad_atta_1kg.png'
    ),
    Product(
      id: 'classmate_180pages_unruled',
      name: 'Classmate 180 Pages Unruled Notebook', 
      price: 99.0, 
      image: 'Classmate 180 Pages Unruled Notebook',
      imagePath: 'assets/images/classmate_180pages_unruled.png'
    ),
    Product(
      id: 'a4_sheetbundle_JK_COPIER',
      name: 'A4 Sheet Bundle JK Copier', 
      price: 199.0, 
      image: 'A4 Sheet Bundle JK Copier',
      imagePath: 'assets/images/a4_sheetbundle_JK_COPIER.png'
    ),
    Product(
      id: 'dumbles_set_kit',
      name: 'Dumbbells Set Kit', 
      price: 999.0, 
      image: 'Dumbbells Set Kit',
      imagePath: 'assets/images/dumbles_set_kit.png'
    ),
  ];

  final List<Map<String, String>> categories = [
    {'label': 'Gaming', 'icon': 'sports_esports'},
    {'label': 'Electronics', 'icon': 'devices'},
    {'label': 'Groceries', 'icon': 'local_grocery_store'},
    {'label': 'Personal Care', 'icon': 'spa'},
    {'label': 'Kitchen', 'icon': 'kitchen'},
  ];

  final List<Map<String, String>> quickBuys = [
    {'label': 'Snacks', 'icon': 'fastfood'},
    {'label': 'Drinks', 'icon': 'local_drink'},
    {'label': 'Fruits', 'icon': 'emoji_food_beverage'},
    {'label': 'Vegetables', 'icon': 'grass'},
  ];

  final random = Random();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.timer, color: AppTheme.primaryColor, size: 24),
            const SizedBox(width: 8),
            Text(
              "Delivery in 10 mins",
              style: theme.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: 'ProductSans',
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.secondaryColor.withAlpha((0.2 * 255).toInt()),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "High Demand",
                style: theme.textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                  fontFamily: 'ProductSans',
                  color: AppTheme.secondaryColor,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: AppTheme.primaryColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search for products...",
                  prefixIcon: Icon(Icons.search, color: AppTheme.primaryColor),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: AppTheme.primaryColor),
                  ),
                ),
                onChanged: (value) {
                  // Add search functionality here if needed
                },
              ),
            ),

            const SizedBox(height: 16),

            // 3. Horizontal Category Bubbles
            SizedBox(
              height: 100, // Adjust height for proper alignment
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () {
                        final validCategory = category['label']!;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExploreScreen(
                              initialCategory: validCategory,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 28, // Adjust radius for better alignment
                            backgroundColor: AppTheme.primaryColor.withAlpha((0.15 * 255).toInt()),
                            child: Icon(
                              IconsHelper.getIcon(category['icon']!),
                              color: AppTheme.primaryColor,
                              size: 24, // Adjust icon size for consistency
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            category['label']!,
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontFamily: 'ProductSans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // 4. Featured Banners (Horizontal Scroll)
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: bannerImages.length,
                itemBuilder: (context, index) => Container(
                  width: 220,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(bannerImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 5. Quick Buys
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Quick Buys",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'ProductSans',
                  )),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: quickBuys.length,
                itemBuilder: (context, index) {
                  final quickBuy = quickBuys[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExploreScreen(initialCategory: quickBuy['label']!),
                        ),
                      );
                    },
                    child: Container(
                      width: 90,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha((0.1 * 255).toInt()),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconsHelper.getIcon(quickBuy['icon']!),
                            color: AppTheme.secondaryColor,
                            size: 30,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            quickBuy['label']!,
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontFamily: 'ProductSans',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 6. Top Offers Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Top Offers",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'ProductSans',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: min(8, products.length), // Ensure no out-of-bounds errors
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 200,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDisplayScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                product.imagePath,
                                fit: BoxFit.contain,
                                width: double.infinity,
                                height: double.infinity,
                                errorBuilder: (context, error, stackTrace) => 
                                    const Icon(Icons.image, size: 50, color: Colors.grey),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              product.name,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'ProductSans',
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '₹${product.price}',
                              style: theme.textTheme.bodySmall!.copyWith(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'ProductSans',
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Add to cart using CartManager
                                final cartManager = Provider.of<CartManager>(context, listen: false);
                                cartManager.addToCart(
                                  product
                                );

                                // Show a snackbar to confirm addition
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('${product.name} added to cart'),
                                    backgroundColor: AppTheme.primaryColor,
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryColor,
                                minimumSize: const Size(double.infinity, 36),
                              ),
                              child: Text(
                                'Add to Cart',
                                style: theme.textTheme.bodySmall!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'ProductSans',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // 7. Buy Again Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text("Buy Again",
                  style: theme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'ProductSans',
                  )),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: 10,
                itemBuilder: (context, index) {
                  final product = products[random.nextInt(products.length)];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDisplayScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha((0.1 * 255).toInt()),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.asset(
                              product.imagePath,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, size: 50, color: Colors.grey),
                            ),
                          ),
                          Text(
                            product.name,
                            style: theme.textTheme.bodySmall!.copyWith(
                              fontSize: 12,
                              fontFamily: 'ProductSans',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 8. Powered by section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 80,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withAlpha((0.08 * 255).toInt()),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withAlpha((0.05 * 255).toInt()),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Center(
                  child: Text("Co-powered by XYZ Brand",
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'ProductSans',
                        color: AppTheme.primaryColor,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper class for icons
class IconsHelper {
  static IconData getIcon(String iconName) {
    switch (iconName) {
      case 'sports_esports':
        return Icons.sports_esports;
      case 'devices':
        return Icons.devices;
      case 'local_grocery_store':
        return Icons.local_grocery_store;
      case 'spa':
        return Icons.spa;
      case 'kitchen':
        return Icons.kitchen;
      case 'fastfood':
        return Icons.fastfood;
      case 'local_drink':
        return Icons.local_drink;
      case 'emoji_food_beverage':
        return Icons.emoji_food_beverage;
      case 'grass':
        return Icons.grass;
      default:
        return Icons.help_outline; // Default icon if no match is found
    }
  }
}