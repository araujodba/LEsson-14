//
//  File.swift
//  LEsson 14
//
//  Created by Marcello Lima on 04/10/21.
//

//
//  Model.swift
//  Module5Lesson14Challenge
//
//  Created by Micah Beech on 2021-04-27.
//

import Foundation

class Model : ObservableObject {
    
    @Published var fact = ""
    
    init() {
        getFact()
    }
    
    func getFact() {
        
        // URL we want to access
        let urlString = "http://numbersapi.com/random/trivia"
        
        // Check if we can create URL from string
        if let url = URL(string: urlString) {
            
            // Create data task
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                // Check for errors
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                // Make sure there is data
                if let data = data {
                    
                    // Turn the data into text form
                    if let stringData = String(data: data, encoding: .utf8) {
                        
                        // UI updates must happen on the main thread
                        DispatchQueue.main.async {
                            self.fact = stringData
                        }
                        
                    }
                }
            }
            .resume() // Remember to start the datatask!
        }
    }
    
}
