//
//  CartItemViewModel.swift
//  SampleCategoryScreen
//
//  Created by Capgemini-DA184 on 5/18/23.
//

import Foundation

class CartItemViewModel: ObservableObject {
   @Published var items = [
        CartItem(name: "Donut", image: "donut", price: 2.97, quantity: 3),
        CartItem(name: "Peas", image: "peas", price: 1.64, quantity: 50),
        CartItem(name: "Oranges", image: "orange", price: 4, quantity: 2)
    ]
}
