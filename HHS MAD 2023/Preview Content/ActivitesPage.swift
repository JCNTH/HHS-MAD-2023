//
//  ContentView.swift
//  HHS MAD 2023
//
//  Created by Dhruv B 2/5/23.
//  Edited by Julian NTH 4/2/23
//

import SwiftUI

struct ActivitiesPage: View {
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    
    @State var createNewActivity = false
    @State var numOfClubs = 0
    
    
    @Binding var newActivity: ActivityManager
    

    
//    @Binding var test: ActivityManager
    
    var body: some View {
        
       
        ZStack {
            //Background color
   
            
           
            
            //Middle Section
            Group {
                
                
                
                //Activites section
                ZStack {
                    VStack {
                        
                        HStack(spacing: 10){
                            Text("ACTIVITIES")
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                               
                            
                            Button {
                                createNewActivity = true
                            } label:
                            {
                                Image(systemName: "plus.square.fill")
                            }
                        } .offset(x: -width/3.8)
                      
//                        Spacer()
                        
                        ScrollView {


                            ForEach(0..<newActivity.activities.count, id: \.self) { value in

                                Button{
                                    UIApplication.shared.open(URL(string: newActivity.activities[value].description)!)

                                } label :{
                                    
                                    
                                    ZStack{
                                        
//                                        AsyncImage(url: URL(string: newActivity.activities[value].image)) { image in
//                                            image.resizable()
//                                                .aspectRatio(contentMode: .fill)
//                                                .frame(width: width/1.2, height: height/5)
//                                                .cornerRadius(20)
//
//                                        } placeholder: {
//                                            ProgressView()
//                                        }
                                        
                                       newActivity.activities[value].image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: width/1.2, height: height/5)
                                            .cornerRadius(20)
                                    
                                        
                                        RoundedRectangle( cornerRadius: 20, style: .continuous)
                                            .frame(width: width/1.2, height: height/5)
                                            .foregroundColor(Color.gray)
                                            .opacity(0.5)
                                        
                                        
                                        Text(newActivity.activities[value].name)
                                            .font(.title).bold()
                                            .foregroundColor(Color.white)

                                    }
                                }
                                
                                Spacer()
                           





                            }

                        }.frame(width: width, height: height/2)
//                            .background(Color.black)

                    }.offset(y: height/4.3)
                    
                    if(createNewActivity)
                    {
                        createActivity(createNewClub: $createNewActivity, numOfClubs: $numOfClubs, Activity: newActivity)
                        
                        
                    }
                        
                }
            }
            
                
        }
        
        
    }
}

//struct ActivitiesPage_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivitiesPage()
//    }
//}

struct createActivity: View {
    @Binding var createNewClub: Bool
    @Binding var numOfClubs: Int
    
    @State var description = ""
    @State var name = ""
    @State var application = ""
    @State var meetings = ""
    @State var showImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    
    let screenRect = UIScreen.main.bounds
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    
    @ObservedObject var Activity: ActivityManager

    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                .frame(width: width/1.2, height: height/1.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .shadow(radius: 10)
            
            ScrollView {
                VStack (spacing: 30){
                    Image(systemName: "cube.transparent.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                
                    Text("Activity Name")
                        .font(.largeTitle).bold()
                        .foregroundColor(Color.green)
                        .padding()
                
                    TextField("Fill in Text", text: $name)
                        .background(Rectangle().fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/15))
                        .foregroundColor(name.isEmpty ? Color.gray.opacity(0.3):Color.black)
                        .font(.headline)
                    
                    Text("Link")
                        .font(.largeTitle).bold()
                        .foregroundColor(Color.green)
                        .padding()
                
                    TextField("Fill in Text", text: $description)
                        .background(Rectangle().fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/15))
                        .foregroundColor(description.isEmpty ? Color.gray.opacity(0.3):Color.black)
                        .font(.headline)
                    
                    Text("Image")
                        .font(.largeTitle).bold()
                        .foregroundColor(Color.green)
                        .padding()
              
                        Text(image == nil ? "Click To Upload":"Click To Change")
                            .background(Rectangle().fill(Color.blue).shadow(radius: 3).frame(width: width/1.2, height: height/15).opacity(0.7))
                            .foregroundColor(Color.white)
                            .font(.headline)
                            .onTapGesture { showImagePicker = true }
                        
                        if(image != nil)
                        {
                            image?
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(0.8)
                        }
                    
                    

                   
//                        .frame(width: width, height: height/10)
                    
                

                    Button{
//                        Activity.setName(name: name)
//                        Activity.setDescription(description: description)
                        if(image == nil)
                        {
                            return
                        }
                        
                        self.Activity.activities.append(Activity_1(id: 1, name: name, description: description, image: image!))
                        
                        description = ""
                        name = ""
                        application = ""
                        meetings = ""
                        

                        createNewClub = false
                    } label: {
                        Text("Create".uppercased())
                            .padding()
                            .background(Color.blue.opacity(1).cornerRadius(10))
                            .foregroundColor(Color.white)
                            .font(.headline)
                           
                    }.onChange(of: inputImage) {_ in loadImage()  }
                        .sheet(isPresented: $showImagePicker){
                            ImagePicker(image: $inputImage)
                        }
                    
                    Spacer()
                }
                
                
            }.frame(width: width/1.2, height: height/1.2)
            .background(Rectangle().fill(Color.white).shadow(radius: 3).frame(width: width/1.2, height: height/1.2))
           
             
           

        }
    }
    
    func loadImage(){
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}


class ActivityManager: ObservableObject {
    @Published var activities: [Activity_1]
    
  
    
    init(){
        self.activities = []
    }

}

struct Activity_1: Identifiable {
    var id: Int
    var name: String
    var description: String
    var image: Image
    var showDescription: Bool
    
    
    init(id: Int, name: String, description: String, image: Image){
            self.id = id
            self.name = name
            self.description = description
            self.image = image
            self.showDescription = false
        }

}




import PhotosUI
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {

    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            guard let provider = results.first?.itemProvider else { return }

            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, _ in
                    self.parent.image = image as? UIImage
                }
            }
        }
    }
}
