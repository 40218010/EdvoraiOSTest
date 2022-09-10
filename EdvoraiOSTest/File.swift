//
//  File.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/9.
//

import Foundation
import SwiftUI



struct File: View {
    @ObservedObject var vm = ViewModel()




    var body: some View {
        NavigationView {
            List(vm.orders) { mmm in
                VStack(alignment: .leading) {
                    HStack {
                        Text("user id:")
                        Text("\(mmm.userID)")
                            .font(.headline)
                    }
                    

                    
                    
                    HStack {
                        Text("order date:")
                        Text(mmm.orderTime)
                        
                        
                    }
                }
            }
            .navigationTitle("Orders")
        }

    }
}

struct File_Previews: PreviewProvider {
    static var previews: some View {
        File()
    }
}
