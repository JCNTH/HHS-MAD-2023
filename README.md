# HHS CONNECT (Homestead FBLA Mobile App Development 2023)

A comprehensive mobile application designed to connect students of Homestead High School and keep them updated on school news and events. Won 9th Place at FBLA Nationals 2023 in Atlanta.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Requirements](#requirements)
4. [Installation](#installation)
5. [Usage/Instructions](#usage/instructions)
6. [CodeSnippet](#codesnippet)
7. [Contributing](#contributing)
8. [Support](#support)
9. [License](#license)
10. [Copyright](#copyright)

## Introduction

The HHS-MAD 2023 mobile application aims to enhance the student experience at Homestead High School by offering a platform for students to connect with their peers and stay updated on important school news and events. This user-friendly app is designed to cater to the needs of students, parents, and teachers by providing a variety of features that streamline communication and promote engagement within the school community.

## Features

The HHS-MAD 2023 app offers a wide range of features that cater to the needs of the school community, including:

1. **Event Feed**: A dedicated space for students to share events, post photos, and link them to seperate web pages for use. 
2. **Calendar**: An organized view of school events, academic schedules, and important deadlines.
3. **Messaging System**: A secure and efficient platform that enables communication between students, parents, and teachers, as well as a bug reporting system.
4. **Photo Sharing**: Allow users to share photos from their device, download, or repost them on other social media platforms.
6. **Homework Forumns** A space for students to post questions/comments/answers about homework, allowing for students to effectively and safely collaborate on a variety of subjects. 

## Requirements

To use the HHS-MAD 2023 mobile app, ensure that your device meets the following requirements:

1. iOS: iOS 12.0 or higher

## Installation

### iOS

To install the HHS-MAD 2023 app on an iOS device, follow these steps:

1. Download the project source code from GitHub.
2. Open the Terminal app on your Mac.
3. Navigate to the project directory using the `cd` command.
4. Run the command `pod install` to install the required dependencies.
5. Open the `HHS-MAD.xcworkspace` file in Xcode.
6. Connect your iOS device to your Mac using a USB cable.
7. Select your device as the build target.
8. Click the "Build and run" button to build and install the app on your device.

## Usage/Instructions

Upon opening the app for the first time, follow these steps to maximize your experience:

1. Sign in using your school credentials (email and password).
2. Complete your profile by adding a profile picture and personal information.
3. Navigate the app using the bottom menu bar to access the Social Feed, Calendar, Messaging System, and Academics Forums.
4. You can post academic questions, as well as photos to share with peers, and approved accounts (such as teachers or club officers) are able to post events that can be seen and accessed by students. 

## CodeSnippets

Here are two code snippets from the project and their explanations:

### Events Page

The Events Page feature of the HHS-MAD 2023 app is implemented using a table view to display posts, with direct linking to wepages. The data is stored and retrieved using Cloud Firestore, a NoSQL document-based database provided by Firebase.

```swift
// Retrieve events page posts from Firestore
db.collection("event_page").order(by: "timestamp", descending: true).getDocuments { (snapshot, error) in
   if error == nil && snapshot != nil {
      var posts = [Post]()
      for doc in snapshot!.documents {
         let post = Post(data: doc.data())
         posts.append(post)
      }
      completion(.success(posts))
   } else {
      completion(.failure(error!))
   }
}
```

The above code snippet shows the implementation of the retrieval of event feed posts from Firestore in the `getPosts` function. The function queries the `event_page` collection in Firestore and orders the results by timestamp in descending order. The data is then converted into `Event` objects and returned in a `success` result, otherwise an `error` is returned in a `failure` result.

### Messaging Firebase and Firestore

```swift
// Read message from Firestore in real-time with the addSnapShotListener
    func getMessages() {
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            
            // If we don't have documents, exit the function
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // Mapping through the documents
            self.messages = documents.compactMap { document -> Message? in
                do {
                    // Converting each document into the Message model
                    // Note that data(as:) is a function available only in FirebaseFirestoreSwift package - remember to import it at the top
                    return try document.data(as: Message.self)
                } catch {
                    // If we run into an error, print the error in the console
                    print("Error decoding document into Message: \(error)")

                    // Return nil if we run into an error - but the compactMap will not include it in the final array
                    return nil
                }
            }
            
            // Sorting the messages by sent date
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            // Getting the ID of the last message so we automatically scroll to it in ContentView
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    // Read message from Firestore in real-time with the addSnapShotListener
    func getMessagesBugs() {
        db.collection("bugs").addSnapshotListener { querySnapshot, error in
            
            // If we don't have documents, exit the function
            guard let documents = querySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            // Mapping through the documents
            self.messages = documents.compactMap { document -> Message? in
                do {
                    // Converting each document into the Message model
                    // Note that data(as:) is a function available only in FirebaseFirestoreSwift package - remember to import it at the top
                    return try document.data(as: Message.self)
                } catch {
                    // If we run into an error, print the error in the console
                    print("Error decoding document into Message: \(error)")

                    // Return nil if we run into an error - but the compactMap will not include it in the final array
                    return nil
                }
            }
            
            // Sorting the messages by sent date
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            // Getting the ID of the last message so we automatically scroll to it in ContentView
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
```
The code snippet showcases the implementation of real-time message retrieval from Firestore in the HHS-MAD 2023 mobile app. It demonstrates the use of the addSnapshotListener method to listen for updates in the Firestore collection named "messages" and "bugs". Whenever changes occur in the collection, the code within the closure is executed to fetch and process the updated documents.

The getMessages() function reads messages from the "messages" collection, while the getMessagesBugs() function reads messages from the "bugs" collection. Both functions follow a similar structure.

Within the closure, the code first checks if there are any documents retrieved from the Firestore query. If documents are present, the closure proceeds to map over the retrieved documents and convert them into instances of the Message model. This conversion utilizes the data(as:) function provided by the FirebaseFirestoreSwift package, which allows the conversion from Firestore documents to strongly-typed objects.

After mapping and converting the documents into Message objects, the messages are sorted by their timestamp property to ensure they are displayed in the correct order. Finally, the ID of the last message is extracted and stored in a variable for further use.

It's important to note that the code handles any errors that may occur during the conversion or sorting process. If an error occurs, it is printed to the console.

This code snippet demonstrates how the HHS-MAD 2023 app leverages Firestore's real-time updates to provide a dynamic messaging feature.


## Contributing

Contributions to the HHS-MAD 2023 app are welcome! Please follow these steps to contribute:

1. Fork the repository on GitHub.
2. Create a new branch for your feature or bug fix.
3. Commit your changes to your branch.
4. Open a pull request, describing your changes and referencing any related issues.
5. Ensure your code adheres to the existing coding style and conventions.

## Support

For assistance or support with the HHS-MAD 2023 app, please create a new issue in the GitHub repository or contact the project maintainers at hhs-mad2023@homesteadhs.edu.

## Installation

Follow these steps to install the HHS-MAD 2023 app on your iOS device:

1. Clone or download the project from the GitHub repository.
2. Open the project in Xcode.
3. Connect your iOS device to your computer.
4. Select your device from the list of available simulators or devices in Xcode.
5. Build and run the project on your device.
6. Once the installation is complete, open the app and sign in using your school credentials.

## License

The HHS-MAD 2023 mobile app is released under the Creative Commons Attribution 3.0 Unported (CC BY 3.0) license. By using the app, you agree to the terms and conditions specified in the license.

## Copyright

Copyright © 2023 Homestead High School Mobile App Development Team. All rights reserved.

Unauthorized copying, distribution, modification, public display, or public performance of this copyrighted work is an infringement of the copyright holder's rights. For permission requests, please contact the copyright owner at hhs-mad2023@homesteadhs.edu.






