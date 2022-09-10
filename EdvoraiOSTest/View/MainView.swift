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
            Color("GrayBrown")
            
            VStack {
                VStack {
                    
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
                                    .foregroundColor(Color("RosyPink"))
                                
                            }
                            
                            
                        }
                    }
                    .padding()
                    
                }
                
                
                ScrollView {
                    VStack(spacing: 20.0) {
                        
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color("MistBlue"))
                            .frame(width: .infinity, height: 200)
                            
                            VStack {
                                Image(systemName: "hare.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 40)
                                
                                Text("Order".uppercased())
                                    .fontWeight(.light)
                                    .font(.system(size: 20))
                            }

                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color("Tea"))
                            .frame(width: .infinity, height: 200)
                            
                            VStack {
                                Image(systemName: "tortoise.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45)
                                
                                Text("User".uppercased())
                                    .fontWeight(.light)
                                    .font(.system(size: 20))
                            }

                        }
                    }
                    .padding()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
