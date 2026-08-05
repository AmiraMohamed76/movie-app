# Movie App

A modern Flutter application that allows users to discover movies and TV series using The Movie Database (TMDB) API. The app provides an intuitive browsing experience with detailed information about movies and TV shows, including cast, recommendations, seasons, and episodes.

The project is built following Clean Architecture principles to ensure scalability, maintainability, and testability. The codebase is organized into independent feature modules, where each module encapsulates its own presentation, domain, and data layers, resulting in a highly modular and reusable architecture.

 ## Architecture
The application follows a feature-first modular structure, where each feature (Movies and TV Series) is completely isolated.

## Each feature contains three layers:
- ✅ Presentation Layer
- ✅ Domain Layer
- ✅ Data Layer


## Technical Highlights
- ✅ Flutter - Dart
- ✅ Clean Architecture
- ✅ Feature-based Modular Design
- ✅ SOLID Principles
- ✅ Repository Pattern
- ✅ Dependency Injection (GetIt)
- ✅ BLoC State Management
- ✅ Immutable State
- ✅ TMDB REST API Integration
- ✅ Reusable UI Components
- ✅ Responsive UI
- ✅ Error & Exception Handling
- ✅ Separation of Concerns
  
## Exception & Error Handling
The application implements a centralized error handling strategy across the data layer.

- ✅ Handles API exceptions.
- ✅ Handles invalid server responses.
- ✅ Converts exceptions into user-friendly failure messages.
- ✅ Uses custom Failure classes to separate business logic from networking concerns.


## State Management
The project uses the BLoC Pattern to separate presentation from business logic.

This project demonstrates best practices in Flutter development by combining Clean Architecture, BLoC state management, feature-based modularization, and robust exception handling to create a scalable, maintainable, and production-ready movie discovery application.
