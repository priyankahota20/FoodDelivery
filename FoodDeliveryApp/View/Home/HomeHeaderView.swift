//
//  HomeHeaderView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 17/05/23.
//

import SwiftUI

struct HomeHeaderView: View {
    @State private var searchText = ""

    var body: some View {

        VStack (alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
            Image(systemName: "cart")
                               .resizable()
                               .aspectRatio(contentMode: .fill)
                               .frame(width: 20, height: 20, alignment: .center)
                               .foregroundColor(Color.init(red: 72.0/255.0, green: 69.0/255.0, blue: 225.0/255))


                               Text("ontheshelf.")
                               .font(.system(size: 22))
                               .foregroundColor(Color.init(red: 72.0/255.0, green: 69.0/255.0, blue: 225.0/255))
                               .padding(.vertical,-4)
                Spacer()
                
            }.padding(20)
            
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                        HStack (alignment: .center,
                                spacing: 10) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .frame(width: 12, height: 12, alignment: .center)
                                        .foregroundColor(.gray)
                                        .frame(minWidth: 0, maxWidth: 30)
                                        .frame(minHeight: 0, maxHeight: 50)
                                    
                                    TextField ("Search", text: $searchText)
                        }  // HSTack
                            .padding([.top,.bottom], 2)
                            .padding(.leading, 5)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(12)
                        //Spacer(minLength: 10)
                        .frame( height: 70)
                }
                
            }
            .padding(.horizontal, 20)
            
            Spacer(minLength:  50)
            ZStack {
                Image("Icon-LoginHeader")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(12)
                    .frame( height: 100)
                    .padding([.leading, .trailing], 20)

                VStack {
                    HStack {
                        HStack {
                            Text("50% off")
                                .foregroundColor(Color.white)
                            .font(.system(size: 22, weight: .bold, design: .default))
                            //.padding(.horizontal, 20)
                            .multilineTextAlignment(.center)
                            
                        }
                        
                        .frame(width: 150, height: 50)
                    .background(Color.black.opacity(0.8))
                    .padding(5)
                        Spacer()
                    }
                    HStack {
                        HStack {
                            Text("All bakery produts \n after 9 PM every day!")
                                .foregroundColor(Color.white)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                            .padding(.horizontal, 40)
                        }
                        Spacer()
                    }
                    
                }
                .padding()
            }
            Spacer()
          
        }
        .frame(maxHeight: 400, alignment: .center)
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView()
    }
}

