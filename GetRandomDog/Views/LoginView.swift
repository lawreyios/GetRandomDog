//
//  LoginView.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/4/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginViewModel()
    
    var loginButton: some View {
        NavigationLink(destination: DogView(url: viewModel.woofUrl), isActive: .constant($viewModel.woofUrl.wrappedValue != "")) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Get Random Dog").foregroundColor(.white).fontWeight(.bold)
                    Spacer()
                }
                Spacer()
            }.frame(minHeight: 55.0, maxHeight: 55.0)
                .background(Color.blue)
                .cornerRadius(2.5)
                .padding(.top, 77.0)
            
        }.simultaneousGesture(TapGesture().onEnded{
            self.loginUser()
        })
    }
    
    var placeHolderTextView: some View {
        PlaceholderTextField(placeholder: Text("Username"), text: $viewModel.username)
            .padding(.top, 32.0)
    }
    
    var passwordTextView: some View {
        SecurePlaceholderTextField(placeholder: Text("Password"), text: $viewModel.password)
            .padding(.top, 32.0)
    }
    
    var titleView: some View {
        VStack(alignment: .leading) {
            Text("Welcome to")
                .tracking(1.0)
            Text("RandomDog App").fontWeight(.bold)
        }.padding(EdgeInsets(top: 44.0, leading: .zero, bottom: .zero, trailing: .zero))
    }
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: .constant(viewModel.isLoading)) {
                VStack(alignment: .leading) {
                    self.titleView
                    self.placeHolderTextView
                    self.passwordTextView
                    self.loginButton
                    Spacer()
                    Spacer()
                }.padding(22.0)
            }
        }
    
    }
    
    private func loginUser() {
        viewModel.getRandomDog()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
