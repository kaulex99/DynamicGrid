//
//  ContentView.swift
//  DynamicGridExample
//
//  Created by Alexander Kauer on 16.12.22.
//

import SwiftUI
import DynamicGrid

struct ContentView: View {
    var body: some View {
        VStack {
            DynamicGrid(horizontalSpacing: 10, verticalSpacing: 10) {
                Rectangle()
                    .foregroundColor(.brown)
                    .frame(width: 100, height: 50)
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 80, height: 20)
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 60)
                Rectangle()
                    .foregroundColor(.brown)
                    .frame(width: 100, height: 50)
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: 250, height: 20)
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: 100, height: 60)
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 50)
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 200, height: 110)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
