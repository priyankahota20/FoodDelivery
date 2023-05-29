//
//  HomeCategoriesView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 25/05/23.
//

import SwiftUI

struct HomeCategoriesView: View {
    @StateObject var categoryData = CategoriesViewModel()

    let coloumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
       // ScrollView {
        VStack {
            LazyVGrid(columns: coloumns, spacing: 20) {
                    ForEach(categoryData.foodItems) {item in
                        CategoryItemView(item: $categoryData.foodItems[getIndex(item: item, type: "food")])
                }
            }
        }.padding([.bottom], 20)
    }
    func getIndex(item: CategoryItem, type: String) -> Int{
        return categoryData.foodItems.firstIndex {(item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
}

struct HomeCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCategoriesView()
    }
}
