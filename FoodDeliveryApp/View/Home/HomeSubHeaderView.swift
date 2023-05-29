//
//  HomeSubHeaderView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 25/05/23.
//

import SwiftUI

struct HomeSubHeaderView: View {
    @State var headerName: String
    var body: some View {
        HStack {
            Text(headerName)
                .font(.system(size: 18, weight: .bold, design: .rounded))
            Spacer()
            Text("Show all")
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(.gray)
        }.padding(20)
    }
}

struct HomeSubHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSubHeaderView(headerName: "On sale")
    }
}
