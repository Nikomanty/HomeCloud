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

# Images from application:
In use on our wall and main menu:

<img src="https://user-images.githubusercontent.com/16851195/218834965-fc2d3d4b-2465-421f-b413-6501905070bb.jpg" width="whatever" height="300">   <img src="https://user-images.githubusercontent.com/16851195/218835355-0de4d1f0-74d9-4b38-9c27-a3e1fba0117e.jpg" width="whatever" height="300">


Calendar View And Calendar event creation:

<img src="https://user-images.githubusercontent.com/16851195/218835231-e895b2b2-f7b0-485e-b122-216facbd9688.png" width="whatever" height="300">   <img src="https://user-images.githubusercontent.com/16851195/218835245-13dad67c-8405-44d2-b17c-57658f3496a2.png" width="whatever" height="300">

Todo View:

<img src="https://user-images.githubusercontent.com/16851195/218835282-eda06ae5-2678-4f3f-9d22-98fe1ccdd09b.png" width="whatever" height="300">

