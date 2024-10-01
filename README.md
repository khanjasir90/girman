# GirmanTech Mobile App Assignment

This project is a mobile application built with **Flutter**, **Dart**, **Firebase**, and **BLoC** for state management. It enables users to search for organization people by name using Firebase, following the design guidelines provided in the Figma prototype.

## Tech Stack

- **Flutter**
- **Dart**
- **Firebase**
- **BLoC (Business Logic Component)**
- **Clean Code Archtechture**

## Features

### 1. Home Screen
- A **minimalistic landing screen** featuring Girman Technologies branding.
- The screen includes:
  - **Top App Bar** with the following actions:
    - **Website**: Redirects users to [girmantech.com](https://girmantech.com) via an in-app web view.
    - **LinkedIn**: Redirects users to [Girman Technologies LinkedIn page](https://www.linkedin.com/company/girmantechnologies) via an in-app web view.
    - **Contact**: Opens the user's default email app with a prefilled email to `contact@girmantech.com`.
  - **Search Box**: Allows users to input search terms and trigger the search.

### 2. Search Results Screen
- Displays search results in a **card-based UI** after the user presses "Enter" or taps the search button.
- Each result card contains:
  - **User Information**: First Name, Last Name, Address, and Phone Number.
  - A **placeholder image** for users.
  - A **"Fetch Details" button**: Opens a dialog displaying detailed user information based on the provided Figma design.
- Handles scenarios where no results are found, displaying an **empty state UI** as per the Figma design.

### 3. Figma Design
- Refer to the Figma design for detailed layout specifications:  
  [Figma Link](https://www.figma.com/design/rJXNcq9yJAZv6T5pMFA0zh/Girman-Mobile-App-Assignment?node-id=1-180&node-type=frame&t=k3rK9zKADlREQFBH-0)

### 4. User Data
- The user data is fetched from FireStore(Firebase)
- The JSON file contains user information that is loaded from firebase and displayed based on the user's search input.
- Edge cases such as invalid inputs or no results found are handled gracefully.


### 5. Screen Shots
