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
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        NavigationStack {
            VStack{
                if selectedImageData.count > 0{
                    // Show Image
                    ScrollView{
                        LazyVGrid(columns: [.init(.adaptive(minimum: 200)), .init(.adaptive(minimum: 200))]){

                            ForEach(selectedImageData, id: \.self){ dataItem in
                               let uiImage = UIImage(data: dataItem)
                                
                                Image(uiImage: uiImage!).resizable().frame(width: 180, height: 150).aspectRatio(contentMode: .fill).cornerRadius(10)
                                

                            }
                        }
                        .padding()
                    }
                }
                else{
                    Spacer()
                    Text("Please select image by tapping on photo icon on toolbar").foregroundColor(.gray).font(.system(size: 25)).bold().multilineTextAlignment(.center)
                }
                Spacer()
                Text("\(selectedImageData.count) photos")
            }
            
            .navigationTitle("Photo Sharing")
            .toolbar{
                PhotosPicker(selection: $selectedImage,maxSelectionCount: 50 ,matching: .images, label: {
                    Image(systemName: "plus.app.fill").tint(.mint)
                        
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
                .padding(.top, 90)
                .padding(.trailing, 75)
                
               
            }
        } .offset(x: 0, y: -height/5)
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


