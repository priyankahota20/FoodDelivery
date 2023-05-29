//
//  OnSellView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 25/05/23.
//

import SwiftUI

struct OnSaleView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 15) {
                ForEach(0..<4){item in
                    GroceryItemView(pushToDetailsPage: false)
                }
            }
            .padding([.leading, .bottom, .top],20)
        }

    }
}

struct OnSaleView_Previews: PreviewProvider {
    static var previews: some View {
        OnSaleView()
    }
}
