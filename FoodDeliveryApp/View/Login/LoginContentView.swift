//
//  LoginContentView.swift
//  FoodDeliveryApp
//
//  Created by Rabindra Chourasia on 16/05/23.
//

import SwiftUI

struct LoginContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    @State private var isEmailValid : Bool   = true
    @State private var emailString  : String = ""
    @State private var isPresented = false
    
    @State private var showingLoginScreen = false
    
    var body: some View {
      
        
        ZStack{
            VStack{
                VStack {
                    HStack {
                        Text("Email")
                            .padding(20)
                        Spacer()
                    }
                    
                    
                    //MARK: Email TextField
                    TextField("", text: $username, onEditingChanged: { (isChanged) in
                        if !isChanged {
                            if self.textFieldValidatorEmail(self.username) {
                                self.isEmailValid = true
                            } else {
                                self.isEmailValid = false
                                //self.username = ""
                            }
                        }
                        
                    })
                    
                    .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                    .background(Color.black.opacity(0.05))
                    
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.vertical, -10)
                    
                    if !self.isEmailValid {
                        HStack {
                        Text("Email is Not Valid")
                            .font(.system(size: 12))
                            .font(.callout)
                            .foregroundColor(Color.red)
                            .padding(30)
                            Spacer()
                        }
                    }
                    
                }
                
                VStack {
                    HStack {
                        Text("Password")
                            .padding(20)
                        Spacer()
                    }
                    
                    //MARK: Password TextField
                    SecureField("", text: $password)
                        .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .padding(.vertical, -10)
                    
                    HStack {
                        Spacer()
                        Button("Forgotten Password"){
                            
                        }
                        .font(.system(size: 12))
                        .foregroundColor(Color.blue)
                        .padding()
                        .offset(x: -10, y: 0)
                        
                    }
                }
                
                VStack {
                    //MARK: Log in Button Action
                    Button("Log in"){
                        isPresented.toggle()
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 40, height: 50)
                    .background(Color.init(red: 2.0/255.0, green: 152.0/255.0, blue: 80.0/255.0))
                    .cornerRadius(10)
                    .padding(5)
                    .fullScreenCover(isPresented: $isPresented, content: TabbarView.init)
                    
                    //MARK: Create an Account Button Action
                    Button("Create an account") {
                        
                        
                    }
                    .foregroundColor(Color.black)
                    .padding(10)
                }
            }
        }
        
        // .navigationBarHidden(true)
        //}
        
    }
    
    // MARK: Vaildation
    private func isPasswordValid(_ password : String) -> Bool{
        let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordTest.evaluate(with: password)
    }
    
    private func validView() -> String? {
        if !self.textFieldValidatorEmail(emailString) {
            return "Email is invalid"
        }
        
        if !self.isPasswordValid(password) {
            return "Password is invalid"
        }
        
        // Do same like other validation as per needed
        
        return nil
    }
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView()
    }
}

