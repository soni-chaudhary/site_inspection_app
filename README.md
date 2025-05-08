#Site Inspection Checklist App
    A cross-platform mobile application built with Flutter for construction site supervisors to log daily inspection tasks. The app follows MVVM architecture with BLoC, simulates an API layer, and persists data locally using sqflite. It is designed to be easily extendable for future integration with backend services.

#Features
    View a list of daily inspection items (e.g., Scaffolding, Electrical Wiring, PPE).
    Mark each item as Passed, Failed, or Not Applicable.
    Track and display a live summary of inspection statuses.
    Reset all statuses in one tap.
    Persist daily reports using local database (sqflite).
    Architected for scalability with clean separation of concerns.
    Basic unit testing coverage on business logic.

#Project Structure
Flutter
lib/
├── main.dart                     // Entry point
├── models/                      // Data models (e.g., InspectionItem)
├── repository/                 // Data abstraction & local DB access
├── data/                       // Simulated API adapter
├── bloc/                       // BLoC files (event, state, logic)
├── ui/                         // Screens (e.g., HomeScreen)
└── widgets/                    // Reusable UI widgets

test/
└── bloc/                       // Unit tests for BLoC logic
#Architecture
    This project uses the MVVM pattern implemented using the BLoC (Business Logic Component) pattern:
        Model: Represents the inspection item entity.
        View: Screens and widgets render the UI.
        ViewModel (BLoC): Handles business logic and state management.
        Repository: Abstraction for data access (local + simulated API).

#Tech Stack
    Flutter (UI Toolkit)
    Dart (Programming Language)
    BLoC (State Management)
    Mock API Layer (Expandable to real backend)
    Unit Testing (flutter_test)

#Getting Started
 Clone the repository
    git clone 
    cd site-inspection-checklist
    Install dependencies


#flutter pub get
    Run the app


#flutter run
 Run tests
   flutter test

#Future Enhancements
    Cloud-based sync (e.g., Firebase or REST API)
    User authentication and profile management
    Report generation and export (PDF or Excel)
    Multi-language support
    Notification/reminder system