MiniMart eCommerce App
MiniMart is a Flutter eCommerce app for browsing products, managing a cart, and favoriting items. It features a clean UI with local IBM Plex Sans fonts, provider state management, SharedPreferences persistence, and named routes, following a Figma design.
Features

Product Listing: 2x2 grid with search.
Product Details: Image (331.9px, 15.r radius), price, description, "Add to Cart" with toast and auto-navigation to cart after 4s, favorite toggle.
Cart: List view with quantity controls, delete, subtotal/shipping/total, empty state with "Shop Now", persists via SharedPreferences.
Favorites: 2x2 grid, persists via SentencesBox.
Navigation: Bottom bar (Home, Favorites, Cart, Profile) with cart badge.
UI: White background, local IBM Plex Sans font, responsive with flutter_screenutil.


Screenshots
Home: home.png
Cart: cart.png
Favorites: favorites.png
ProductDetails: details_screen.png



Setup

Clone Repository:
git clone https://github.com/ayolateef/minimart-project.git
cd minimart-project


Install Dependencies:
flutter pub get


Font Assets:

Place ibmplexsans-bold.ttf, ibmplexsans-regular.ttf, ibmplexsans-semibold.ttf in assets/fonts/.
Ensure pubspec.yaml includes:flutter:
assets:
- assets/fonts/
fonts:
- family: IBMPlexSans
fonts:
- asset: assets/fonts/ibmplexsans-regular.ttf
weight: 400
- asset: assets/fonts/ibmplexsans-semibold.ttf
weight: 600
- asset: assets/fonts/ibmplexsans-bold.ttf
weight: 700




iOS Setup (if needed):
cd ios
pod install
cd ..


Run App:
flutter run


Build APK:
flutter build apk --release

Output: build/app/outputs/flutter-apk/app-release.apk


File Structure
minimart-project/
├── assets/
│   ├── fonts/         # IBM Plex Sans fonts
│   ├── svgs/         # SVG icons
├── lib/
│   ├── models/       # Product, CartItem
│   ├── providers/    # Product, Cart, Favorite, BottomNav
│   ├── screens/     # Home, ProductList, ProductDetail, Cart, Favorite
│   ├── utils/       # AppColors, AppTextStyles, AppSvgs, RoutePath
│   ├── widgets/     # BottomNavColumn, CartItemCard, CustomButton
│   ├── app_router.dart
│   ├── main.dart
├── pubspec.yaml
├── README.md
├── img/

Dependencies
dependencies:
flutter_screenutil: ^5.9.0
provider: ^6.1.1
shared_preferences: ^2.3.0
flutter_svg: ^2.0.10
dotted_border: ^2.1.0

Testing

Cart: Add items, delete last item → Verify empty state, "Shop Now", bottom nav persists.
Product Details: "Add to Cart" → Toast, navigates to cart after 4s. Toggle favorite → Persists.
Navigation: Switch Home, Favorites, Cart, Profile. Check cart badge.
Product List: Test search, product tap to details.
Favorites: Verify grid, empty state.
Fonts: Confirm IBM Plex Sans loads offline.
Build: Test on Android/iOS.

Known Issues (Fixed)

Font Loading: Uses local IBM Plex Sans to avoid fonts.gstatic.com errors.
Bottom Nav: CartScreen refactored to retain bottom nav.
Description Bullets: Fixed splitting to preserve periods.

Contributing
Fork, branch, commit, and open a Pull Request.
License
MIT License
Contact
[latmania@gmail.com] or GitHub issues.
Updated: June 3, 2025
