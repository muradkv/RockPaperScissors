# Rock-Paper-Scissors iOS Game

![Swift](https://img.shields.io/badge/Swift-5.0+-FA7343?logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-18.0+-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-15.0+-147EFB?logo=xcode&logoColor=white)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-8A2BE2)

A classic Rock-Paper-Scissors game built natively for iOS, developed as the **Day 25 Challenge** of the 100 Days of SwiftUI course.

Instead of just trying to win, the game tells you whether you need to win or lose the current round. You have to react quickly to the computer's move based on that rule!

## Preview

<img width="25%" alt="start" src="https://github.com/user-attachments/assets/974d6ad7-b4d2-4e00-9832-693a16f41389" /> <img width="25%" alt="gameplay" src="https://github.com/user-attachments/assets/e3b15fd1-2e59-4d97-a498-79959d2e6ec9" /> <img width="25%" alt="game_over" src="https://github.com/user-attachments/assets/a9c2cf77-916c-48f9-84e4-fb0ba98077ed" />

## Features

* **Brain-Teasing Gameplay:** The added "Must WIN / Must LOSE" rule forces you to think before you tap, making a simple game much more engaging.
* **Custom Interface:** Built entirely from scratch using reusable views, like the computer's choice card and the action buttons.
* **Round Tracker:** A clean, dynamic progress indicator that fills up as you play through the 5 rounds.

## About the Challenge

This application was built to fulfill the **Milestone: Projects 1-3 (Day 25)** challenge of the SwiftUI learning path created by Paul Hudson (Hacking with Swift). 

The core goal of this milestone was to consolidate the concepts learned in the first three projects and build an app entirely from scratch. Key topics practiced in this project include:
* **Structural Layouts:** Combining `VStack`, `HStack`, and `ZStack` to design the screen architecture.
* **State Management:** Using `@State` to track the game score, current round, and the app's dynamic UI updates.
* **UI Controls & Alerts:** Handling user input via custom `Button` views and presenting end-of-game conditions using `Alert`.
* **Styling & Gradients:** Applying custom colors, linear gradients, and rounded typography.
* **View Composition:** Breaking down a massive `ContentView` into smaller, reusable components to keep the code clean and scalable.

🔗 **[Full challenge description here](https://www.hackingwithswift.com/guide/ios-swiftui/2/3/challenge)**
