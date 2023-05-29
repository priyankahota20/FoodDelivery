//
//  GroceryItemView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 25/05/23.
//

import SwiftUI

struct GroceryItemView: View {
    @State var pushToDetailsPage: Bool

    var body: some View {

        VStack(spacing: 8) {
            HStack{
                Button(action: {
                  //  toggleLike(grocery)
                }) {
                    Image( "ic_heart_check")
                        
                }
                Spacer()
                Text("-30%")
                    .font(.system(size: 12))
                    .foregroundColor(Color.white)
                    .frame(height: 25)
                    .frame(maxWidth: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 50, style: .continuous).fill(Color.init(red: 218.0/255.0, green: 32.0/255.0, blue: 32.0/255))
                  )
                  .overlay(
                      RoundedRectangle(cornerRadius: 50, style: .continuous)
                          .strokeBorder(Color.init(red: 218.0/255.0, green: 32.0/255.0, blue: 32.0/255), lineWidth: 1)
                  )

            }
                
            Image("ic_banana")
                    .resizable()
                    .frame(width: 130, height: 100)
            
            HStack{
                Text("Banana")
                Spacer()
            }
            HStack(){
                Text("$24")
                Text("$2")
                    .foregroundColor(.red)
                    .font(
                            .system(size: 20)
                            .weight(.bold)

                        )
                Text("/ 1pc")
                    .foregroundColor(.gray)
                Spacer()
                    
            }
            NavigationLink(destination: GroceryDetailsView( areYouGoingToSecondView: false).navigationBarHidden(true), isActive: $pushToDetailsPage) { EmptyView() }

            
            Button(action: {
                self.pushToDetailsPage = true // Step 4

            
            }) {
                Text("Add to Basket    ")
                    .padding(8)
                
                    .background(Color(red: 34/255, green: 139/255, blue: 34/255))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .font(
                            .system(size: 16)
                            .weight(.semibold)

                        )
            }
        }
        .padding()
        .background(Color.white.opacity(0.90))
        .cornerRadius(10)
        .shadow(radius: 5)
        .frame(width: (UIScreen.main.bounds.width / 2) - 25, alignment: .leading)
    }
}


struct GroceryItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemView(pushToDetailsPage: false)
    }
}
