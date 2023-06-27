//
//  EventPage.swift
//  HHS MAD 2023
//
//  Created by Aaditya Raj on 2/27/23.
//

import SwiftUI

import FirebaseStorage

struct EventPage: View {
    
    @State var event:Event;
    @State var headerImage = UIImage(systemName: "photo.fill")
    @State var uploads = [UIImage(systemName: "photo.fill"), UIImage(systemName: "photo.fill")];
    
    var body: some View {
            VStack {
                Text(event.name)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .fontWeight(.medium)
                    .padding(.bottom, -10.0)
                
                VStack{
    //                Image (calendarVM.getImageForEvent(event.id))
    //                    .resizable()
    //                    .aspectRatio(contentMode: .fit)
    //                    .cornerRadius(40)
                    Image(uiImage: headerImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(20)
    //                else {
    //                    let defaultPhoto = UIImage(systemName: "photo.fill")!
    //                    Image(uiImage: defaultPhoto)
    //                        .resizable()
    //                        .aspectRatio(contentMode: .fit)
    //                        .cornerRadius(20)
    //                }
                    
                    HStack {
                        Text("Time:")
                            .bold()
                        Spacer()
                        let time = event.date.formatted(date: .omitted, time: .complete)
                        Text(time)
                            .italic()
                    }.padding()
                    .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color(red: 85/255, green: 172/255, blue: 85/255), lineWidth: 3)
                    )
                    
                    HStack {
                        Text("Date:")
                            .bold()
                        Spacer()
                        let date = event.date.formatted(date: .complete, time: .omitted)
                        Text(date)
                            .italic()
                    }.padding()
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 85/255, green: 172/255, blue: 85/255), lineWidth: 3)
                        )
                    HStack {
                        Text("Location:")
                            .bold()
                        Spacer()
                        Text(event.location)
                            .italic()
                    }.padding()
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 85/255, green: 172/255, blue: 85/255), lineWidth: 3)
                        )
                    
                    HStack(alignment: .top) {
                        Text("Description:")
                            .bold()
                        Spacer()
                        Text(event.details)
                            .italic()
                    }.padding()
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(red: 85/255, green: 172/255, blue: 85/255), lineWidth: 3)
                        )

                }
                .padding(/*@START_MENU_TOKEN@*/.all, 20.0/*@END_MENU_TOKEN@*/)
                
            }.padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .onAppear {
                retrieveHeaderImage()
                retrieveUploads()
        }

//        .background(RoundedRectangle(cornerRadius: 30).foregroundColor(Color(hue: 0.335, saturation: 0.189, brightness: 0.897)))
    }
    
    func retrieveUploads() {
        print("Retrieve Uploads")
        
        let storage = Storage.storage();
        let storageRef = storage.reference();
        let upload1Ref = storageRef.child("events/\(event.name)/uploads/upload1")
        let upload2Ref = storageRef.child("events/\(event.name)/uploads/upload2")
        
        upload1Ref.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if (error == nil && data != nil) {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        uploads[0] = image;
                    }
                }
            } else {
                print(error!.localizedDescription)
            }
        }
        
        upload2Ref.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if (error == nil && data != nil) {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        uploads[1] = image;
                    }
                }
            } else {
                print(error!.localizedDescription)
            }
        }
    }
    
    func retrieveHeaderImage() {
        print("Retrieving header image")
        let storage = Storage.storage();
        let storageRef = storage.reference();
        let headerImageRef = storageRef.child("events/\(event.name)/header.jpeg")

        headerImageRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
            if (error == nil && data != nil) {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        headerImage = image;
                    }
                }
            } else {
                print (error!.localizedDescription)
            }
        }
    }
    
}


//
//struct EventPage_Previews : PreviewProvider {
//    static var previews : some View {
//        EventPage(event: Event(name: "Bike around school", location: "Homestead", date: Date(), repeatDay: "none", details: "bike around school", type: "School"));
//    }
//}
