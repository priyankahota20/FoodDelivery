//
//  CategoriesView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 17/05/23.
//

import SwiftUI

struct CategoriesView: View {
    @Binding var tabSelection: Int
    var body: some View {
        CategoryView()

    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(tabSelection: .constant(1))
    }
}
