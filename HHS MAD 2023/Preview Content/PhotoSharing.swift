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
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    let viewController = ViewController()
    
    var body: some View {
        ScrollView {
            VStack{
                if selectedImageData.count > 0{
                    // Show Image
                    ScrollView{
                        LazyVGrid(columns: [.init(.adaptive(minimum: 200)), .init(.adaptive(minimum: 200))]){

                            ForEach(selectedImageData, id: \.self){ dataItem in
                               let uiImage = UIImage(data: dataItem)
                                
                                
                                Image(uiImage: uiImage!).resizable().frame(width: 180, height: 130).aspectRatio(contentMode: .fill).cornerRadius(10)
                                
                               
//                                Controller.shareToInstaStories()

                            }
                        }
                        .padding()
                    }
                }
                else{
            
                    Text("Add Photos ").foregroundColor(.gray).font(.system(size: 25)).bold().multilineTextAlignment(.center)
                }
         
//                Text("\(selectedImageData.count) photos")
            }
         
            Button{
               share = true
            } label : {
                Text("hi")
            }.sheet(isPresented: $share) {
                ShareSheet(activityItems: ["Hello World"])
            }

            
            
           
                PhotosPicker(selection: $selectedImage,maxSelectionCount: 50 ,matching: .images, label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .tint(.mint)
                    
                        
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
              
                
               
           
        }.offset(y: -200)
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


