//
//  FavoritesView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 17/05/23.
//

import SwiftUI
struct Grocery: Identifiable {
    let id = UUID()
    let name: String
    let imgName: String
    var isLiked: Bool = false
    var price: Double
}

struct FavoritesView: View {
    

    var body: some View {
        ZStack {
                CollectionView()
        }
    }
}
struct CollectionView: View {
    @State private var groceries = [
        Grocery(name: "Mango", imgName: "ic_mango", price: 2.0),
        Grocery(name: "Banana", imgName: "ic_banana", price: 4.0),
        Grocery(name: "Donut", imgName: "ic_donut", price: 6.0),
        Grocery(name: "Chocolate", imgName: "ic_chocolate", price: 8.0),
        Grocery(name: "Orange", imgName: "ic_orange", price: 9.0),
        Grocery(name: "Grapes", imgName: "ic_grapes", price: 15.0),
        Grocery(name: "Watermelon", imgName: "ic_watermelon", price: 20),

    ]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var showDetail = false
    var body: some View {
            VStack {
                ScrollView {
                    HStack {
                        Text("Favourties")
                            .padding(.all, 12)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.black)
                            .background(Color.white)
                        Spacer()
                    }
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(groceries) { grocery in
                        VStack(spacing: 8) {
                            HStack{
                                Button(action: {
                                    toggleLike(grocery)
                                }) {
                                    Image( grocery.isLiked ? "ic_heart_check" : "ic_heart_uncheck")
    //                                    .foregroundColor(grocery.isLiked ? .green : .gray)
                                     
                                        
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
                                
                            Image(grocery.imgName)
                                    .resizable()
                                    .frame(width: 130, height: 100)
                            
                            HStack{
                                Text(grocery.name)
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
                            NavigationLink(destination: GroceryDetailsView(areYouGoingToSecondView: false) .navigationBarHidden(true).edgesIgnoringSafeArea(.top)) {
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

                       
                    }
                    
                    .cornerRadius(10)
                }
                .padding()
                
                }
            }
    }
    
    func addToCart(_ grocery: Grocery) {
        // Add your implementation here to add the grocery to the cart
        print("Added to cart: \(grocery.name)")
//        NavigationLink(destination: GroceryDetailsView()) {
//                            Text("Do Something")
//                        }
        
    }
    
    func toggleLike(_ grocery: Grocery) {
        if let index = groceries.firstIndex(where: { $0.id == grocery.id }) {
            groceries[index].isLiked.toggle()
        }
    }
    
    func toggleDislike(_ grocery: Grocery) {
        if let index = groceries.firstIndex(where: { $0.id == grocery.id }) {
            groceries[index].isLiked.toggle()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
