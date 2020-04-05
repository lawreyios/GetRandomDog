//
//  LoadingView.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/4/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import SwiftUI

fileprivate let loadingText = "Loading"

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var content: () -> Content

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                if (!self.isShowing) {
                    self.content()
                } else {
                    self.content()
                        .disabled(self.isShowing)
                        .blur(radius: self.isShowing ? 3 : 0)

                    VStack {
                        Text("Loading ...")
                        LoadingIndicator(style: .large)
                    }
                    .frame(width: geometry.size.width / 3.0, height: geometry.size.height / 6.0)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.isShowing ? 1 : 0)
                }
            }
        }
    }
}
