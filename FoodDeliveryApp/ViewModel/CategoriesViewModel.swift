//
//  CategoriesViewModel.swift
//  SampleCategoryScreen
//
//  Created by Capgemini-DA184 on 5/22/23.
//

import Foundation

class CategoriesViewModel: ObservableObject {
   @Published var generalItems = [
        CategoryItem(name: "New in", image: "NewIn", categoryType: "general"),
        CategoryItem(name: "Super sale", image: "Sale", categoryType: "general")
    ]
    
    @Published var foodItems = [
         CategoryItem(name: "Bakery", image: "Bakery", categoryType: "food"),
         CategoryItem(name: "Fruits", image: "Fruits", categoryType: "food"),
         CategoryItem(name: "Meat", image: "Meat", categoryType: "food"),
         CategoryItem(name: "Fish", image: "Fish", categoryType: "food"),
         CategoryItem(name: "Vegetables", image: "Vegetables", categoryType: "food"),
         CategoryItem(name: "Dairy", image: "Sale", categoryType: "food"),
         CategoryItem(name: "Sweets", image: "Sweet", categoryType: "food"),
         CategoryItem(name: "Snacks", image: "Dairy", categoryType: "food")
     ]
    
    @Published var beveragesItems = [
         CategoryItem(name: "Alcohol", image: "Alcohol", categoryType: "beverages"),
         CategoryItem(name: "Juices", image: "Juices", categoryType: "beverages"),
         CategoryItem(name: "Coffee", image: "Coffee", categoryType: "beverages"),
         CategoryItem(name: "Soda", image: "Soda", categoryType: "beverages")
    ]
    
    @Published var othersItems = [
         CategoryItem(name: "Pharmacy", image: "Pharmacy", categoryType: "other"),
         CategoryItem(name: "Beauty", image: "Beauty", categoryType: "other"),
         CategoryItem(name: "Toiletries", image: "Toiletries", categoryType: "other"),
         CategoryItem(name: "Household", image: "Household", categoryType: "other")
    ]
}
