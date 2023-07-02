//
//  ApiReq.swift
//  ApiRequestTest
//
//  Created by Assem on 02/07/2023.
//

import Foundation
import SwiftUI

struct Course: Hashable,Codable{
    let title: String
    let body: String
}

class apiRequestModel: ObservableObject {
    
    /*
     an ObservableObject is a protocol that allows you to create an object that can be observed by views. This means that when the object's properties change, any views that depend on those properties will automatically update to reflect the new values.
     */
    @Published var courses: [Course] = []
    
    func fetch(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){[weak self]data,_,error in
            guard let data = data, error == nil else{
                return
            }
            //convert to json
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
        
        
    }
}
