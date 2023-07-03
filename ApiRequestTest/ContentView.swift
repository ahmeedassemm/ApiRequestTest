//
//  ContentView.swift
//  ApiRequestTest
//
//  Created by Assem on 02/07/2023.
//

import SwiftUI



struct ContentView: View {
    @StateObject var ApiRequestModel = apiRequestModel()
    @StateObject var ApiPostModel = apiPostModel()
    @State var titleInput = ""
    @State var bodyInput = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("API Post Request")
            
            List{
                ForEach(ApiRequestModel.courses, id: \.self){course in
                    Text(course.title)
                        .bold()
                        .foregroundColor(.cyan)
                    Text(course.body)
                        .font(.caption)
                }
            }
            VStack {
                Text("Make a POST request")
                    .font(.title2)
                .bold()
                HStack{
                    Text("Title: ")
                    TextField("Enter title here", text: $titleInput)
                                   .textFieldStyle(RoundedBorderTextFieldStyle())
        //                           .padding()
                    Spacer()
                }
                HStack{
                    Text("Body:")
                    TextField("Enter body here", text: $bodyInput)
                                   .textFieldStyle(RoundedBorderTextFieldStyle())
        //                           .padding()
                    Spacer()
                }
                
                
                Button("POST"){
                    ApiPostModel.postReq(title: titleInput, body: bodyInput)
                }
            }
            
          
        }
        .padding()
        .onAppear(){
            ApiRequestModel.fetch()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
