# ⚡️ PokeStats - iOS Pokedex App

A modern, clean, and intuitive iOS application that allows users to search for Pokemon stats in real-time. Built with **Swift** and **UIKit**, focusing on UI/UX best practices and robust networking.

## 🎨 Screenshots

| Light Mode | Dark Mode | Error Handling |
|:---:|:---:|:---:|
| <img src="https://github.com/user-attachments/assets/51c83270-cd81-44c3-b5b7-285ea24655ac" width="250"> | <img src="https://github.com/user-attachments/assets/bb6a15bb-abca-4978-aed3-1e15ab3843b9" width="250"> | <img src="https://github.com/user-attachments/assets/26e4433b-45b4-4091-9d2c-408b2748adf3" width="250"> |

## 🚀 Key Features

* **Dark & Light Mode Support:** Dynamic colors and background assets that adapt to the system theme.
* **Networking:** Fetches data from [PokeAPI](https://pokeapi.co/) using `URLSession`.
* **Robust Error Handling:** User-friendly error messages and visual cues (red placeholder) when a Pokemon is not found.
* **Advanced Keyboard Handling:** * Tap anywhere to dismiss the keyboard.
    * "Search" button on the keyboard triggers the API call.
* **Auto Layout:** Fully responsive design that works on all iPhone screen sizes.

## 🛠 Tech Stack

* **Language:** Swift 5
* **Interface:** UIKit, Storyboard (Auto Layout)
* **Architecture:** MVC (Model-View-Controller) pattern
* **Networking:** URLSession, JSONDecoder (Codable)
* **Design Pattern:** Delegate Pattern (for TextField and Network management)

## 📦 How to Run

1.  Clone the repository:
    ```bash
    git clone https://github.com/Dev-MuTTiNeeR/PokeStats.git
    ```
2.  Open `PokeStats.xcodeproj` in Xcode.
3.  Press **Cmd + R** to run on the Simulator or your device.

## 👨‍💻 Author

**Cem Akkaya**
* **GitHub:** [Dev-MuTTiNeeR](https://github.com/Dev-MuTTiNeeR)

---
*This project is created for educational purposes and is not affiliated with Pokémon or Nintendo.*
