# Home Cloud
Application used by our family for calendar, todo and weather tracking.

Calendar events and todos are stored in firebase cloud storage and service handles communication with it. Weather box uses Openweathermap APIs to get weather data. As a state management, Cubit pattern comes into play.

Current implementation doesnt support multiple users so if you want to build application for yourself, you have to configure own firebase and Openweathermap API key.

New features are developed when I have time,
Some ideas listed here:
- Layout changes when different screensize
- Shopping lists
- Media Controlling
- Inside weather
- Curtain/"Home widget" controlling (Very far in future, need actual devices for these last 2)

# Images from application (Texts are in Finnish, sorry):
In use on our wall and main menu:

<img src="https://user-images.githubusercontent.com/16851195/222543981-c5ffcf91-ffe6-41bc-b703-371ec5483a4c.jpg" width="whatever" height="300">   <img src="https://user-images.githubusercontent.com/16851195/222543286-a362b688-e6f7-4aaf-95be-1818d4cbef82.jpg" width="whatever" height="300">

Calendar View And Calendar event creation:

<img src="https://user-images.githubusercontent.com/16851195/222543045-976167e0-0e8a-4def-b6b7-021a559502fc.jpg" width="whatever" height="300">   <img src="https://user-images.githubusercontent.com/16851195/222543141-f8038226-b499-4f47-8a27-1b5a4100d75f.jpg" width="whatever" height="300">

Todo View:

<img src="https://user-images.githubusercontent.com/16851195/222543395-19631457-81a7-4a37-92f8-3042bb8ae970.jpg" width="whatever" height="300">
