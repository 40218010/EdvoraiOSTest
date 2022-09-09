//
//  ContentView.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/9.
//

import SwiftUI
import ImagePickerView


struct ContentView: View {
    @State var showImagePicker: Bool = false
    @State var image: UIImage?
    
    var body: some View {
        ZStack {
            Color.orange
            VStack{
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Button {
                    showImagePicker.toggle()
                } label: {
                    Text("pick image")
                }

            }
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(sourceType: .photoLibrary) { image in
                    self.image = image
                }
        }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
