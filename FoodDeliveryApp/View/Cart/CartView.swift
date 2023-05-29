//
//  CartView.swift
//  SampleCategoryScreen
//
//  Created by Capgemini-DA184 on 5/16/23.
//

import SwiftUI

struct CartView: View {
    @StateObject var cartData = CartItemViewModel()
    @Binding var tabSelection: Int
    @State var pushToOrderDetails: Bool // Step 2
    @Environment(\.dismiss) var dismiss
    @State var isComingFromDetailsPage: Bool

    var body: some View {
        VStack() {
            Spacer(minLength: 20)
            HStack(spacing: 15) {
                if isComingFromDetailsPage {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 26, weight: .heavy))
                            .foregroundColor(.black)
                    }
                }
               Text("Your Basket")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                   
               Spacer()
            }
            .padding(.leading, 20)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 15) {
                    ForEach(cartData.items){item in
                        
                        CartItemView(item: $cartData.items[getIndex(item: item)])
                        
                    }
                }
            }
            
            ZStack {
                
                VStack(spacing: 10) {
                    
                    HStack {
                        Text("Subtotal")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color.black)
                        Spacer(minLength: 0)
                        Text("$8.61")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 10)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    HStack {
                        Text("Delivery")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(Color.black)
                        Spacer(minLength: 0)
                        Text("$1.00")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    
                    VStack {
                        Divider()
                    HStack {
                        Text("Total")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(Color.black)
                        Spacer(minLength: 0)
                        Text("$9.61")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.black)
                    }
                    }
                    .padding(.all, 20)

                  

                    NavigationLink(destination: TrackOrderDetails(tabSelection: $tabSelection).navigationBarHidden(true), isActive: $pushToOrderDetails) { }
                    Button {
                        self.pushToOrderDetails = true
                    } label: {
                        Text("Order now")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(Color.init(red: 2.0/255.0, green: 152.0/255.0, blue: 80.0/255.0))
                            .cornerRadius(15)
                            .padding([.bottom], 20)
                    }
                }
                
                .background(Color.white
                    .clipShape(CustomCorners(cornors: [.topLeft, .topRight], radius: 15))
                    .shadow(color: Color.gray.opacity(0.3), radius: 4.0, x: 0, y: 0)
                    .mask(Rectangle().padding(.top, -20))
                            
                    )
                }

            }

    }
    func getIndex(item: CartItem) -> Int{
        return cartData.items.firstIndex {(item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(tabSelection: .constant(1), pushToOrderDetails: false, isComingFromDetailsPage: false)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CustomCorners: Shape {
    var cornors: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: cornors, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
