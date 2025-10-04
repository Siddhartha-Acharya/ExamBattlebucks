Project setup instructions :
Open the project in Xcode by double-clicking the .xcodeproj or .xcworkspace file.
Ensure the iOS deployment target is set to iOS 17 (as your project was created with this version).
Run the project using a simulator or a physical device. The app displays a list of items and allows marking/unmarking them as favorites, stored locally using Core Data.

iOS & Xcode version used: iOS: 17.0
Xcode: 26.0.1
Swift: 5
SwiftUI for UI
Core Data for local persistence

Brief explanation of architecture (MVVM): Model: Defines the data structure and handles data storage.
ViewModel: Manages the app’s logic, prepares data for the View, and reacts to changes in the Model. Keeps the View updated using bindings or observers.
View: Displays the UI, observes the ViewModel for updates, and sends user interactions back to the ViewModel.

Any assumptions or improvements you would make with more time: Like first of all here we can develop pagination and better scrolling and also for mark/unmark i used Core data but here i recomend post API for better user experience.
