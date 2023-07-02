//
//  ContentView.swift
//  ApiRequestTest
//
//  Created by Assem on 02/07/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var ApiRequestModel = apiRequestModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("API Get Request")
            List{
                ForEach(ApiRequestModel.courses, id: \.self){course in
                    Text(course.title)
                        .bold()
                        .foregroundColor(.cyan)
                    Text(course.body)
                        .font(.caption)
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
