//
//  BasketView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 17/05/23.
//

import SwiftUI

struct BasketView: View {
    @Binding var tabSelection: Int

    var body: some View {
        CartView(tabSelection: $tabSelection, pushToOrderDetails: false, isComingFromDetailsPage: false)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView(tabSelection: .constant(1))
    }
}
