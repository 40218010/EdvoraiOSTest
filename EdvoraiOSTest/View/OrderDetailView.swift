//
//  File.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/9.
//

import SwiftUI



struct OrderDetailView: View {
    @ObservedObject var network = Network()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(network.orders) { order in
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Spacer()
                            Text(order.orderTime)
                                .font(.title3)
                                .fontWeight(.light)
                            Spacer()
                            
                        }
                        
                        
                        HStack {
                            Text("Order id:")
                            Text("\(order.orderID)")
                        }
                        
                        HStack {
                            Text("Product id:")
                            Text("\(order.productID)")
                        }
                        
                        HStack {
                            Text("User id:")
                            Text("\(order.userID)")
                        }
                        
                    }
                    .foregroundColor(Color("MistBlue"))
                    .padding()
                    .background(
                        Color("GrayBrown").cornerRadius(15)
                    )
                    .padding(.horizontal)
                }
                .onAppear{
                    network.getOrder()
                }
                .navigationTitle("Orders")
            }
        }
        
    }
}

struct OrderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetailView()
    }
}
