//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 3/11/23.
//


import SwiftUI
import PhotosUI
import FirebaseStorage
import FirebaseFirestore



struct PhotoSharing: View {
   
    @State private var selectedImage:[PhotosPickerItem] = []
    @State private var selectedImageData: [Data] = []
    @State var share = false
    @State private var selected: Bool = false
    @State var selectedPhoto: UIImage = UIImage(systemName: "square.and.arrow.up")!
    @State var showImage: Bool = false
    @State var fadeInOut: Bool = false
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    let viewController = ViewController()
    
    var body: some View {
        
        
        ZStack{
            if(showImage == false)
            {
                VStack(spacing: -height/1.2){
                    ZStack {
//                        RoundedRectangle(cornerRadius: 10)
//                            .frame(width: width, height: height/2)
//                            .foregroundColor(Color.gray)
//                            .opacity(0.25)
//                            .offset(y: -310.0)
                        ScrollView{
                            if selectedImageData.count > 0{
                                // Show Image
                                ScrollView{
                                    LazyVGrid(columns: [.init(.adaptive(minimum: 200)), .init(.adaptive(minimum: 200))]){
                                        
                                        ForEach(selectedImageData, id: \.self){ dataItem in
                                            let uiImage = UIImage(data: dataItem)
                                            Button{
                                              
                                                selectedPhoto = uiImage!
                                                showImage = true
                    
                                            } label : {
                                                Image(uiImage: uiImage!).resizable().frame(width: 185, height: 130).aspectRatio(contentMode: .fill).cornerRadius(10)
        //
                                                    }
                                                
                                            }
                                    }
                                   
                                }
                            }
                            else{
                                VStack{
                                    Image(systemName: "camera.circle")
                                        .resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fill).cornerRadius(10)
                                        
                                    Text("No Photos Yet").foregroundColor(.black).font(.system(size: 25)).bold().multilineTextAlignment(.center)
                                }.offset(y: 30)
                               
                               
                            }
                            
                            
                        }.offset(y: 50)
                        
                        
                    }
                        
                        
                        VStack(spacing: 30){
                            
                            
                            HStack{
                                PhotosPicker(selection: $selectedImage,maxSelectionCount: 50 ,matching: .images, label: {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: width/2.3, height: height/20)
                                        
                                        Text("Add Photos")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 20)).bold().multilineTextAlignment(.center)
                                    }
                                    
                                    
                                        
                                })
                            
                                .onChange(of: selectedImage){ newItem in
                                    Task{
                                        selectedImage = []
                                        for item in newItem {
                                            if let data = try? await item.loadTransferable(type: Data.self){
                                                selectedImageData.append(data)
                                                uploadPhoto(data: data)
                                            }
                                        }
                                    }
                                }
                                
                                
                                Button{
                                    showImage.toggle()
                                } label : {
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 10)
                                            .frame(width: width/2.3, height: height/20)
                                        
                                        Text(showImage ? "Column View" : "Grid View")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 20)).bold().multilineTextAlignment(.center)
                                    }
                                }
                            }.offset(y: -80.0)
                            
//                            if(InstagramSharingUtils.canOpenInstagramStories){
                                Button{
                                    share = true
                                } label : {
                                    Image(systemName: "square.and.arrow.up.fill")
                                        .resizable()
                                        .frame(width: 50, height: 60)
                                }
//                            }
//                            Button{
//                               share = true
//                            } label : {
//                                Image(systemName: "square.and.arrow.up.fill")
//                                    .resizable()
//                                    .frame(width: 50, height: 60)
//                            }.sheet(isPresented: $share) {
//                                ShareSheet(activityItems: ["Selected Image"])
//                            }
                    }
                }
            }
            
            
            
            if(showImage == true)
            {
                test(image: $selectedPhoto, share: $share, images: $selectedImageData, selectedImage: $selectedImage, shareImage: $showImage)
                    .onAppear(){
                        withAnimation(Animation.easeIn(duration: 0.6)) {
                          
                        }
                    }
                   

            }
        }.onAppear {
            retrievePhotos()
        }
        
        
    }
    
    func uploadPhoto(data : Data) {
        let storageRef = Storage.storage().reference();
        
        let path = "photos/\(UUID().uuidString).jpg";
        
        let fileRef = storageRef.child(path)
        
        fileRef.putData(data, metadata: nil) { metadata, error in
            
            if (error != nil) {
                print(error!.localizedDescription);
            } else {
                let db = Firestore.firestore()
                db.collection("photos").document().setData(["url":path])
            }
        }
        
        
        
    }
    
    func retrievePhotos() {
        let db = Firestore.firestore();
        
        db.collection("photos").getDocuments { snapshot, error in
            
            if (error == nil && snapshot != nil) {
                var paths = [String]()
                for doc in snapshot!.documents {
                    paths.append(doc["url"] as! String)
                }
                
                for path in paths {
                    let storageRef = Storage.storage().reference()
                    
                    let fileRef = storageRef.child(path)
                    
                    fileRef.getData(maxSize: 5 * 1024 * 1024) { data, error in
                        
                        if error == nil && data != nil {
                            DispatchQueue.main.async {
                                selectedImageData.append(data!)
                            }
                        }
                    }
                }
                
                
            }
        }
        
        
        
    }
    
    
    
    
    
  
}



enum NoFlipEdge {
    case left, right
}

struct NoFlipPadding: ViewModifier {
    let edge: NoFlipEdge
    let length: CGFloat?
    @Environment(\.layoutDirection) var layoutDirection
    
    private var computedEdge: Edge.Set {
        if layoutDirection == .rightToLeft {
            return edge == .left ? .trailing : .leading
        } else {
            return edge == .left ? .leading : .trailing
        }
    }
    
    func body(content: Content) -> some View {
        content
            .padding(computedEdge, length)
    }
}

extension View {
    func padding(_ edge: NoFlipEdge, _ length: CGFloat? = nil) -> some View {
        self.modifier(NoFlipPadding(edge: edge, length: length))
    }
}

struct PhotoSharing_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSharing()
    }
}

struct photoExample: View{
    let image: UIImage
    
    @State var liked = false
    @State var share = false
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View{
        VStack{
            VStack{
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: 280)
                    .clipped()
            }
            
            
            
            HStack(spacing: 270){
                Button{
                    liked.toggle()
                } label : {
                    Image(systemName: liked ? "heart.fill":"heart")
                        .resizable()
                        .foregroundColor(liked ? Color.red: Color.black)
                        .frame(width: 35, height: 33)
                }
                
               
                    Button{
                        share = true
//                                                        InstagramSharingUtils.shareToInstagramStories(uiImage2!)
                    } label : {
                        Image(systemName: "square.and.arrow.up.fill")
                            .resizable()
                            .frame(width: 33, height: 40)
                            .foregroundColor(Color.black)
                            .offset(y: -4)
                    }.sheet(isPresented: $share) {
                        ShareSheet(activityItems: [image])
                    }
                
                
                
                
            }
            .padding(.trailing, 10.0)
            
        }
    }
}

struct test: View {
    @Binding var image: UIImage
    @Binding var share: Bool
    @Binding var images: [Data]
    @Binding var selectedImage: [PhotosPickerItem]
    @Binding var shareImage: Bool
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @State var liked = false

    //Create UNIQUE structs for each
    var body: some View {
//        let image2: UIImage = image.asUIImage() // Works Perfectly
        ZStack{
            ZStack {
            ScrollView{
               
                    ScrollView{
                        if images.count > 0{
                            // Show Image
                            ScrollView{
                                
                                ForEach(images, id: \.self){ dataItem in
                                    let uiImage2 = UIImage(data: dataItem)
                                    
                                    ZStack{
                                        
                                        photoExample(image: uiImage2!)
                                        
                                        
                                    }
                                }
                               
                            }
                        }
                        else{
                            VStack{
                                Image(systemName: "camera.circle")
                                    .resizable().frame(width: 50, height: 50).aspectRatio(contentMode: .fill).cornerRadius(10)

                                Text("No Photos Yet").foregroundColor(.black).font(.system(size: 25)).bold().multilineTextAlignment(.center)
                            }
                           
                           
                        }
                        
                        
                    }.offset(y: 10)
                    
                    
                }

            }
            .padding(.top, 70.0)
            
            
            HStack{
                PhotosPicker(selection: $selectedImage,maxSelectionCount: 50 ,matching: .images, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: width/2.3, height: height/20)
                        
                        Text("Add Photos")
                            .foregroundColor(Color.white)
                            .font(.system(size: 20)).bold().multilineTextAlignment(.center)
                    }
                    
                    
                        
                })
            
                .onChange(of: selectedImage){ newItem in
                    Task{
                        selectedImage = []
                        for item in newItem {
                            if let data = try? await item.loadTransferable(type: Data.self){
                                images.append(data)
                            }
                        }
                    }
                }
                
                
                Button{
                    shareImage.toggle()
                } label : {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: width/2.3, height: height/20)
                        
                        Text(shareImage ? "Column View" : "Grid View")
                            .foregroundColor(Color.white)
                            .font(.system(size: 20)).bold().multilineTextAlignment(.center)
                    }
                }
            }.offset(y: 62)
       
           
            
//            Text("Photos")
//                .foregroundColor(.black).font(.system(size: 25)).bold().multilineTextAlignment(.center)
//                .frame(width: width, height: 50)
//                .background(Color.white)
//                .offset(y: -215)
               
        }
        
        
    }
}




//struct InstagramSharingUtils {
//
//  // Returns a URL if Instagram Stories can be opened, otherwise returns nil.
//  private static var instagramStoriesUrl: URL? {
//    if let url = URL(string: "instagram-stories://share?source_application=com.mad.hhsconnect") {
//      if UIApplication.shared.canOpenURL(url) {
//        return url
//      }
//    }
//    return nil
//  }
//
//  // Convenience wrapper to return a boolean for `instagramStoriesUrl`
//  static var canOpenInstagramStories: Bool {
//    return instagramStoriesUrl != nil
//  }
//
//  // If Instagram Stories is available, writes the image to the pasteboard and
//  // then opens Instagram.
//  static func shareToInstagramStories(_ image: UIImage) {
//
//    // Check that Instagram Stories is available.
//    guard let instagramStoriesUrl = instagramStoriesUrl else {
//      return
//    }
//
//    // Convert the image to data that can be written to the pasteboard.
//    let imageDataOrNil = UIImage.pngData(image)
//    guard let imageData = imageDataOrNil() else {
//      print("🙈 Image data not available.")
//      return
//    }
//    let pasteboardItem = ["com.instagram.sharedSticker.backgroundImage": imageData]
//    let pasteboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(60 * 5)]
//
//    // Add the image to the pasteboard. Instagram will read the image from the pasteboard when it's opened.
//    UIPasteboard.general.setItems([pasteboardItem], options: pasteboardOptions)
//
//    // Open Instagram.
//    UIApplication.shared.open(instagramStoriesUrl, options: [:], completionHandler: nil)
//  }
//}

struct ShareSheet: UIViewControllerRepresentable {
    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void
    
    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]? = nil
    let callback: Callback? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
                   activityItems: activityItems,
                   applicationActivities: applicationActivities)
               controller.excludedActivityTypes = excludedActivityTypes
               controller.completionWithItemsHandler = callback
               return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // nothing to do here
    }
}
