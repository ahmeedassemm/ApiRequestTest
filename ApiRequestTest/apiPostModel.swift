//
//  apiPostModel.swift
//  ApiRequestTest
//
//  Created by Assem on 03/07/2023.
//

import Foundation

class apiPostModel: ObservableObject {
    func postReq(title: String, body:String){
        
        let params = [
            "title": title,
            "body": body
        ]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Application/Json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let session = URLSession.shared.dataTask(with: request){data, repsonse, error in
            if let error = error {
                print("Error Occured", error.localizedDescription)
            }else{
                if let jsonRes = try? JSONSerialization.jsonObject(with: data!){
                    print(jsonRes)
                }
            }
        }
        session.resume()
        
    }
}
