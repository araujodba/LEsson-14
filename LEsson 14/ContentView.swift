//
//  ContentView.swift
//  LEsson 14
//
//  Created by Marcello Lima on 04/10/21.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var model = Model()

    var body: some View {
        VStack {
            Spacer()
            Text(model.fact)
                .padding()
                .multilineTextAlignment(.leading)
                .padding(40)
        
            
            Button("Get a new fact!") {
                model.getFact()
            }
            Spacer()
        }.ignoresSafeArea()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
