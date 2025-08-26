# Movies App

A Flutter application that provides users with a seamless movie browsing experience.  
The app allows users to explore movies, view detailed information, cast, ratings, screenshots, and manage their own profile.

---

## Features
- Search movies by title
- Explore tab for trending and popular movies
- Detailed movie information: description, rating, cast, and screenshots
- Wishlist to save favorite movies
- History to track recently viewed movies (stored locally using Hive)
- User profile management: edit profile and choose an avatar
- Password reset functionality
- Carousel slider for featured movies
- Connectivity check for online/offline states
- Persistent local storage for user preferences and watch history
- Cached images for performance optimization
- Onboarding screens for first-time users

---

## Technologies & Packages
- **State Management**: Bloc, Flutter Bloc, Provider  
- **Dependency Injection**: Injectable, GetIt  
- **Networking**: Dio, HTTP  
- **Functional Programming**: Dartz  
- **Local Storage**: Hive, Hive Flutter, Shared Preferences, Path Provider  
- **UI & Styling**: Google Fonts, Carousel Slider, Cached Network Image  
- **Connectivity**: Connectivity Plus  
- **Onboarding**: Introduction Screen  

---

## Architecture
The project follows **Clean Architecture with MVVM pattern**, ensuring scalability, testability, and maintainability:

- **Presentation Layer** → Flutter UI with Bloc/Provider  
- **Domain Layer** → Entities and Use Cases (business logic)  
- **Data Layer** → Repository pattern with Remote (Dio/HTTP) and Local (Hive/SharedPreferences) sources  

---

## Screenshots

### Main Tabs
| Home | Search | Explore | Profile |
|------|--------|---------|---------|
| ![Home](assets/ScreenShots/Movies%20App%20Home%20Tab.png) | ![Search](assets/ScreenShots/Movies%20App%20Search%20Tab.png) | ![Explore](assets/ScreenShots/Movies%20App%20Explore%20Tab.png) | ![Profile](assets/ScreenShots/Movies%20App%20Profile%20Tab.png) |

### Other Screens
| Movie Details | Extra Details | Edit Profile | Register |
|---------------|---------------|--------------|----------|
| ![Details](assets/ScreenShots/Movies%20App%20Movie%20Details.png) | ![Extra Details](assets/ScreenShots/Movies%20App%20More%20Movie%20Details.png) | ![Edit Profile](assets/ScreenShots/Movies%20App%20Edit%20Profile%20Tab.png) | ![Register](assets/ScreenShots/Movies%20App%20Register.png) | 
