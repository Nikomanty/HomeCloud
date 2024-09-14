# Home Cloud
Application is used in our family to manage and simplify our daily life

*Home Cloud code has been moved to private repository due to possibility to develop it into actual commercial product.*  
*Code snippets coming soon for some reference*

## Description
Home Cloud is designed to manage calendars, weekly tasks, create shopping lists and track the weather efficiently. 

The application supports both English and Finnish. It provides a flexible solution for daily household organization.

- Calendar events can be assigned to specific family member. Every family member has their own color which makes it easy to see whose event it is.
- Weekly tasks is designed to simplify managing recurring tasks. These tasks could be basic household chores, mowing the lawn on summer etc.
- Shopping list feature makes it easy to create and manage shopping lists, keeping them close in hand while shopping.

### Upcoming features
- Recipe book
- Authentication and users
- Media Controlling
- Inside weather
- Curtain/"Home widget" controlling (Very far in future, need actual devices for these last 2)

## Technology and patterns

### Code framework
Home Cloud is coded with Flutter framework to make it easy to build application for both iOS and Android using same code.

Application code is strucuted with Feature-first pattern, which means that all features are separated to their own folders to reduce depedencies and make it easier to maintain. Core functionality of application like navigation, extensions, constants etc. are located under core folder. If something has to be shared between features for example base / reusable widgets, shared business logic are stored under shared folder.

Localization files are located in own folder

### Backend
Calendar events and weekly tasks are securely stored in Firebase Cloud Storage, ensuring seamless access and synchronization across devices. For real-time weather updates, the app integrates OpenWeatherMap APIs. 

### State management
The state management is handled using the Cubit pattern, ensuring a smooth and responsive user experience.

## Screenshots from application:
Events seen in these images are not actual events used by our family, they are just for testing purposes.

Splash screen / Logo:

<img src="https://github.com/user-attachments/assets/29d19900-ce9d-4d67-8b48-063f760a5980" width="whatever" height="200">

Main menu:

<img src="https://github.com/user-attachments/assets/d2518ee0-7d3f-4991-9b7a-cea5e6afc14a" width="whatever" height="300">   <img src="https://github.com/user-attachments/assets/a2360c04-29b3-4f62-bac3-88a87152b44c" width="whatever" height="300">

Calendar View And Calendar event creation:

<img src="https://github.com/user-attachments/assets/8fa9b703-cd6d-47f3-9d86-2788c5285860" width="whatever" height="300">   <img src="https://github.com/user-attachments/assets/57668faa-cc52-49bf-be56-28498c85f6cc" width="whatever" height="300">   <img src="https://github.com/user-attachments/assets/9e13c021-8998-49c9-acb2-fec87783760c" width="whatever" height="300">

Weekly Schedule view

<img src="https://github.com/user-attachments/assets/b4995731-c08a-4a07-a71f-824e7a970b3e" width="whatever" height="300">   <img src="https://github.com/user-attachments/assets/46df8ace-7cd1-4ee8-a654-6756a91b21f1" width="whatever" height="300">


Icons in calendar grid by Icons8 (https://icons8.com)
