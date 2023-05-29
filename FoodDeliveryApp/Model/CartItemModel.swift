//
//  CartItemModel.swift
//  SampleCategoryScreen
//
//  Created by Capgemini-DA184 on 5/18/23.
//

import Foundation

struct CartItem: Identifiable{
    
    var id = UUID().uuidString
    var name: String
    var image: String
    var price: Float
    var quantity: Int
}
