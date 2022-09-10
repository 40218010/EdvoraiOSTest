//
//  UserDetailView.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/11.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var network = Network()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(network.users) { user in
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("User id:")
                                Text("\(user.userID)")
                            }
                            
                            HStack {
                                Text("Name:")
                                Text(user.name)
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .foregroundColor(Color("RosyPink"))
                    .padding()
                    .background(
                        Color("SageGreen").cornerRadius(15)
                    )
                    .padding(.horizontal)
                }
                .onAppear{
                    network.getUser()
                }
                .navigationTitle("Users")
            }
        }
        
    }
}


struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
