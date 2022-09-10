//
//  Network.swift
//  EdvoraiOSTest
//
//  Created by 林大屍 on 2022/9/10.
//

import Foundation





class ViewModel: ObservableObject {
    
    @Published var orders = [Order]()
    @Published var users = [User]()
    
    init() {
        //json decoding simulation
        /* Timer.scheduledTimer(withTimeInterval: 2,repeats: false) { (_) in
         self.items = 0..<10
         
         } */
        
        guard let url = URL(string:
                                "https://assessment.api.vweb.app/orders") else { return }
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
            //check resp status and err
            guard let data = data else { return }
            do {
                let order = try JSONDecoder().decode([Order].self, from: data)
                print(order)
                
                DispatchQueue.main.async {
                    self.orders = order
                }
                
            } catch {
                print("Failed to decode: \(error)")
            }
            
        }.resume()
        
        guard let url = URL(string:
                                "https://assessment.api.vweb.app/users") else { return }
        URLSession.shared.dataTask(with: url) { (data,resp,err) in
            //check resp status and err
            guard let data = data else { return }
            do {
                let user = try JSONDecoder().decode([User].self, from: data)
                print(user)
                
                DispatchQueue.main.async {
                    self.users = user
                }
                
            } catch {
                print("Failed to decode: \(error)")
            }
            
        }.resume()
        
        
        
    }
    
    
}


