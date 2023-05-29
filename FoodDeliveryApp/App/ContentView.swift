//
//  ContentView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 15/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators:  false) {
        VStack(alignment: .center, spacing: 20) {
                LoginHeaderView()
            LoginContentView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
