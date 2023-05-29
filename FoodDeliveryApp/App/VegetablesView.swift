//
//  VegetablesView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 23/05/23.
//

import SwiftUI
struct Vegetable: Identifiable {
    let id = UUID()
    let name: String
    let imgName: String
    var isLiked: Bool = false
    var price: Double
}
struct VegetablesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var backButton : some View { Button(action: {
          self.presentationMode.wrappedValue.dismiss()
          }) {
              HStack {
              Image(systemName: "arrow.backward") // BackButton Image
                  .aspectRatio(contentMode: .fit)
                  .foregroundColor(.black)
                  Text("Vegetables") //translated Back button title
                      .font(.system(size: 20, weight: .heavy))
              }
          }
      }
    
    var body: some View {
        ZStack {
            VegetableCollectionView(pushToDetailsPage: false)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
}

struct VegetableCollectionView: View {
    @State private var vegetables = [
        Vegetable(name: "Cucumber", imgName: "ic_cucumber", price: 2.0),
        Vegetable(name: "Broccoli", imgName: "ic_banana", price: 4.0),
        Vegetable(name: "Peas", imgName: "ic_donut", price: 6.0),
        Vegetable(name: "Hokkdaido", imgName: "ic_chocolate", price: 8.0),
        Vegetable(name: "Orange", imgName: "ic_orange", price: 9.0),
        Vegetable(name: "Grapes", imgName: "ic_grapes", price: 15.0),
        Vegetable(name: "Watermelon", imgName: "ic_watermelon", price: 20),

    ]
    
    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    @State var pushToDetailsPage: Bool
    var body: some View {
       // NavigationView {
            VStack {
                ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(vegetables) { veg in
                        VStack(spacing: 8) {
                            HStack{
                                Button(action: {
                                    toggleLikeVeg(veg)
                                }) {
                                    Image( veg.isLiked ? "ic_heart_check" : "ic_heart_uncheck")
                                                                             
                                }
                                Spacer()

                            }
                                
                            Image(veg.imgName)
                                    .resizable()
                                    .frame(width: 130, height: 100)
                            
                            HStack{
                                Text(veg.name)
                                Spacer()
                            }
                            HStack(){
                                Text("$24")
                                //font(
                                //                                            .system(size: 20)
                                //                                            .weight(.bold)
//                                Text("$2")
//                                    .foregroundColor(.red)
//                                    .font(
//                                            .system(size: 20)
//                                            .weight(.bold)
//
//                                        )
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
                       
                    }
                    
                    .cornerRadius(10)
                }
                .padding()
                
                }
            }
    }
    
    func addToCart(_ vegetable: Vegetable) {
        // Add your implementation here to add the grocery to the cart
        print("Added to cart: \(vegetable.name)")
     
        
    }
    
    func toggleLikeVeg(_ vegetable: Vegetable) {
        if let index = vegetables.firstIndex(where: { $0.id == vegetable.id }) {
            vegetables[index].isLiked.toggle()
        }
    }
    
    func toggleDislikeVeg(_ vegetable: Vegetable) {
        if let index = vegetables.firstIndex(where: { $0.id == vegetable.id }) {
            vegetables[index].isLiked.toggle()
        }
    }
}
struct VegetablesView_Previews: PreviewProvider {
    static var previews: some View {
        VegetablesView()
    }
}
