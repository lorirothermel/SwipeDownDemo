//
//  ContentView.swift
//  SwipeDownDemo
//
//  Created by Lori Rothermel on 5/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var items: Int = 1
    @State private var randomNumbers: [Int] = []
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(randomNumbers, id: \.self) { number in
                    let color = (number == randomNumbers.max() ? Color.green : Color.black)
                    Text("\(number)")
                        .foregroundColor(color)
                }  // ForEach
            }  // List
            .navigationTitle("Random Number")
            .onAppear {
                getRandomNumbers()
            }  // .onAppear
            .refreshable {
                getRandomNumbers()
            }
        }  // NavigationStack
    }  // some View
    
    
    func getRandomNumbers() {
        randomNumbers = []
        
        for _ in 1...10 {
            let tempRandomNumber = Int.random(in: 0...100)
            randomNumbers.append(tempRandomNumber)
        }  // for
        
        randomNumbers.shuffle()
        
    }  // getRandomNumbers
    
}  // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
