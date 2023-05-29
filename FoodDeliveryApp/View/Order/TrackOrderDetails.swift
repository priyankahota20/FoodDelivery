//
//  TrackOrderDetails.swift
//  SampleCategoryScreen
//
//  Created by Capgemini-DA184 on 5/17/23.
//

import SwiftUI

struct TrackOrderDetails: View {
    @State var isNavigationBarHidden: Bool = true
    @Binding var tabSelection: Int
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
            VStack {
            ScrollView(.vertical, showsIndicators: false) {
                Text("Order #2294 Details")
                    .font(.system(size: 25, weight: .bold, design: .monospaced))
                    .padding([.top, .leading], 60)
                
                VStack(spacing: 0){

                    TrackProgressView(orderTrackStatus: "Order Placed", orderStatusDetail:"Your order #2244 was placed.", dateStr: "22 August, 2022, 9:38 A.M", isLast: false, isActive: true)
                    TrackProgressView(orderTrackStatus: "Processing", orderStatusDetail:"Your order is being prepared right now and soon will be ready out for delivery.", dateStr: "22 August, 2022, 10:15 A.M", isLast: false, isActive: true)
                    TrackProgressView(orderTrackStatus: "Delivery", orderStatusDetail: "Your order is being delivered", dateStr: "", isLast: false, isActive: false)
                    TrackProgressView(orderTrackStatus: "Delivered", orderStatusDetail: "Your order has been delivered successfully. Tell us your feedback here.", dateStr: "", isLast: true, isActive: false)

                }
            }
            .offset(x: -20)
                Button(action: {
                               // Navigate back to the root view
                               presentationMode.wrappedValue.dismiss()
                                tabSelection = 1
                           }) {
                    Text("Back to homepage")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.init(red: 2.0/255.0, green: 152.0/255.0, blue: 80.0/255.0))
                        .cornerRadius(15)
                        .padding([.bottom], 20)
//                        .onTapGesture {
//
                        }
        }

    }
}

struct TrackOrderDetails_Previews: PreviewProvider {
    static var previews: some View {
        TrackOrderDetails(tabSelection: .constant(1))
    }
}
