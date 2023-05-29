//
//  TabbarView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 17/05/23.
//

import SwiftUI
enum Tab {
    case dashboard
    case home
    case second
}
struct TabbarView: View {
    @State var tabSelection = 1

    var body: some View {
        NavigationView{
            TabView(selection: $tabSelection) {
                HomeView()
                    .tabItem({
                        Image(systemName: "house.fill")
                        
                    }).tag(1)
                    .navigationBarHidden(true)
                CategoriesView(tabSelection: $tabSelection)
                    .tabItem({
                        Image(systemName: "list.bullet")
                            .foregroundColor(.red)
                            .accentColor(.red)
                            .colorMultiply(.red)
                    }).tag(2)
                FavoritesView()
                    .tabItem({
                        Image(systemName: "heart.fill")
                    }).tag(3)
                BasketView(tabSelection: $tabSelection)
                    .tabItem({
                        Image(systemName: "cart")
                            .accentColor(.gray)
                            .colorMultiply(.gray)
                        
                    }).tag(4)
            }
        }.accentColor(.black)
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
