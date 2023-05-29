//
//  HomeView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 16/05/23.
//

import SwiftUI
struct HomeView: View {

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
       // ZStack {
            VStack(spacing: 0) {
                HomeHeaderView()
                Spacer(minLength: 30)
                HomeSubHeaderView(headerName: "On sale")
                OnSaleView()
                
                HomeSubHeaderView(headerName: "Categories")
                HomeCategoriesView()
                HomeSubHeaderView(headerName: "Order again")
                OnSaleView()
                }
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
