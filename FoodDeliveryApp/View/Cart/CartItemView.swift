//
//  CartItemView.swift
//  SampleCategoryScreen
//
//  Created by Capgemini-DA184 on 5/18/23.
//

import SwiftUI

struct CartItemView: View {
    @Binding var item: CartItem
    var body: some View {
        HStack(spacing: 10) {
            
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .padding(.leading, 10)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(item.name)
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color.gray)
                    Spacer(minLength: 0)
                    Image(systemName: "trash")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                }
                HStack {
                    
                    HStack(spacing: 0) {
                        Button {
                            print("minus")
                        } label: {
                            Image(systemName: "minus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                        Text("\(item.quantity)")
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                            //.background(Color.black.opacity(0.06))
                        Button {
                            print("plus")
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .heavy))
                                .foregroundColor(.black)
                        }
                        
                    }
                    .frame(width: 100, height: 40)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 1.5, x: 0, y: 0)
                    
                    Spacer(minLength: 0)
                    //let checkedPrice = "\(item.price)"
                    Text("$0.15")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
            }
            .padding()
        }        
        .frame(width: UIScreen.main.bounds.width - 40, height: 100)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 0.5)
        )
    }
}

//struct CartItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartItemView()
//    }
//}
