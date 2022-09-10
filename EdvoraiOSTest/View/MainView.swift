//
//  ContentView.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/9.
//

import SwiftUI
import ImagePickerView


struct MainView: View {
    
    @State var image: UIImage?
    
    @State var activeSheet: ActiveSheet?

    
    var body: some View {
        ZStack {
            Color("GrayBrown")
            
            VStack {
                VStack {
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            activeSheet = .third
                            
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
                        
                        Button {
                            activeSheet = .first
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(Color("MistBlue"))
                                    .frame(height: 200)
                                    .frame(minWidth: 0,
                                           maxWidth: .infinity)
                                
                                VStack {
                                    Image(systemName: "hare.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40)
                                    
                                    Text("Order".uppercased())
                                        .fontWeight(.light)
                                        .font(.system(size: 20))
                                }
                                .foregroundColor(.black)
                                
                            }
                        }

                        
                        
                        Button {
                            activeSheet = .second
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(Color("Tea"))
                                    .frame(height: 200)
                                    .frame(minWidth: 0,
                                           maxWidth: .infinity)
                                
                                VStack {
                                    Image(systemName: "tortoise.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 45)
                                    
                                    Text("User".uppercased())
                                        .fontWeight(.light)
                                        .font(.system(size: 20))
                                }
                                .foregroundColor(.black)
                                
                            }
                        }

                        

                    }
                    .padding()
                }
                
                
            }
            
            .sheet(item: $activeSheet) { item in
                switch item {
                case .first:
                    OrderDetailView()
                case .second:
                    UserDetailView()
                case .third:
                    ImagePickerView(sourceType: .photoLibrary) { image in
                        self.image = image
                    }
                }
            }
            
        }
        
    }
}

enum ActiveSheet: Identifiable {
    case first, second, third
    
    var id: Int {
        hashValue
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
