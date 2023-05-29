//
//  LoginHeaderView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 15/05/23.
//

import SwiftUI

struct LoginHeaderView: View {
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            Image("home-banner1")
                .resizable()
            VStack (alignment: .leading) {
                HStack(alignment: .top, spacing: 12) {
                Image("ic_basket")
                                   .resizable()
                                   .aspectRatio(contentMode: .fit)
                                   .frame(width: 20, height: 20, alignment: .center)
                                   .accentColor(.white)
                                   .colorMultiply(.white)
                                 


                                   Text("ontheshelf.")
                                   .font(.system(size: 18))
                                   .foregroundColor(Color.white)
                    Spacer()
                    
                }.padding(20)
                
                Spacer()
            }
            
            Text("Fresh goods \ndelivered to door \nyour doorstep!")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .padding(.vertical, 20)
                .padding(.horizontal, 20)
                .foregroundColor(Color.white)
            
            
        }
        .frame(maxHeight: 320, alignment: .center)
    }
}

struct LoginHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoginHeaderView()
            .previewLayout(.sizeThatFits)
            .environment(\.colorScheme, .dark)
    }
}
