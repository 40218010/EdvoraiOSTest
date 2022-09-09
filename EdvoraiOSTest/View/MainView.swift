//
//  ContentView.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/9.
//

import SwiftUI
import ImagePickerView


struct MainView: View {
    @State var showImagePicker: Bool = false
    @State var image: UIImage?
    
    var body: some View {
        ZStack {
            Color("RosyPink")
            
            VStack {
                VStack{
  
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            showImagePicker.toggle()
                        } label: {
                            if image != nil {
                                Image(uiImage: image!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50)
                                    .clipped()
                                    .cornerRadius(100)
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(Color("GrayBrown"))

                            }

                            
                    }
                    }
                    .padding()

                }
                Spacer()
                
                .sheet(isPresented: $showImagePicker) {
                    ImagePickerView(sourceType: .photoLibrary) { image in
                        self.image = image
                    }
            }
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
