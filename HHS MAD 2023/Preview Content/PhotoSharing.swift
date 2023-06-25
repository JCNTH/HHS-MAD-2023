//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 3/11/23.
//


import SwiftUI
import PhotosUI



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
                            
                        
                            Button{
                               share = true
                            } label : {
                                Image(systemName: "square.and.arrow.up.fill")
                                    .resizable()
                                    .frame(width: 50, height: 60)
                            }.sheet(isPresented: $share) {
                                ShareSheet(activityItems: ["Selected Image"])
                            }
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
        }
        
        
    }
    
    
    
    
    
  
}

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

    
    var body: some View {
//        let image2: UIImage = image.asUIImage() // Works Perfectly
        ZStack{
            
            
           
            ZStack {
//                RoundedRectangle(cornerRadius: 10)
//                    .frame(width: width, height: height/2)
//                    .foregroundColor(Color.gray)
//                    .opacity(images.count > 0 ? 0:0.25)
//                    .offset(y: -60)
                   
            
            
            ScrollView{
               
                    ScrollView{
                        if images.count > 0{
                            // Show Image
                            ScrollView{
                                
                                ForEach(images, id: \.self){ dataItem in
                                    let uiImage2 = UIImage(data: dataItem)
                                    
                                    ZStack{
                                        
                                        
                                        VStack{
                                         
                                            
                                            VStack{
                                                
                                                
                                                
                                                
                                                Image(uiImage: uiImage2!)
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
                                                }.sheet(isPresented: $share) {
                                                    ShareSheet(activityItems: ["Selected Image"])
                                                }
                                                
                                                Button{
                                                    share = true
                                                } label : {
                                                    Image(systemName: "square.and.arrow.up.fill")
                                                        .resizable()
                                                        .frame(width: 33, height: 40)
                                                        .foregroundColor(Color.black)
                                                        .offset(y: -4)
                                                }.sheet(isPresented: $share) {
                                                    ShareSheet(activityItems: ["Selected Image"])
                                                }
                                            }
                                            .padding(.trailing, 10.0)
                                            
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
            }.offset(y: 80)
       
           
            
//            Text("Photos")
//                .foregroundColor(.black).font(.system(size: 25)).bold().multilineTextAlignment(.center)
//                .frame(width: width, height: 50)
//                .background(Color.white)
//                .offset(y: -215)
               
        }
        
        
    }
}



