# # Zenjob Code Challenge

Thank you again for giving me the opportunity, i had so much fun working on the challenge. The project is using **MVVM** architecture and organized by screens

- - - -
## Technologies & Tools
* Xcode 10.2.1 
* Swift 5

- - - -
## Tasks
- [x] Network Layer using native components and protocols
- [x] Performing Login Request
- [x] Getting List of Offers
- [x] Getting Offer Details
- [x] Implementing Tab bar controller
- [x] Implementing  Offers Page using Collection View
- [x] Implementing Empty State in Offers Page
- [x] Implementing  Offer Page using Scroll View and Stack Views
- [x] Implementing  Map Page using MapKit
- [x] Adding Shifts to Calendar
- [x] Adding Unit Tests
- [x] Adding Localization in English and German
- [x] Performing Pull to refresh
- [x] Pagination fetching

- - - -
## Discussion
I had some assumptions and actions around some functionalists 

* The app is performing the login task in the AppDelegate and it’s not handling what happens on error responses, i could’ve redirected the user to an empty page with a message and a retry button, but in real situations the app would have a login page that will perform the login task.
* The requests and responses aren’t being cached, but i would’ve used  cache policies and checked for cached responses before performing a fetch request but i would need a way to check if any updates available on the server before fetching the data
* I’m not sure about how the app behaves and if the offers are unique per user or can be taken by others before the user can accept or reject it, therefore i didn’t add offline mode. But in case there is one then i would persist the data on the phone and add an offline queue for user’s actions if the offers are unique per user
* I’m not sure if i was supposed to add an animated transition from the Offers to the Offer details page like the app store, because i noticed that the design is following the new iOS ui guidelines. 
* The General Details section in the Offer Page was confusing a bit, i built a fixed view for it with 3 rows, 2 for the pricingTables and one for the Total, but i’m not sure if the “pricingTables” are maximum 2 or not, and if when i get one item to only show one row. But if that’s the case then i would’ve initialized it dynamically

- - - -
