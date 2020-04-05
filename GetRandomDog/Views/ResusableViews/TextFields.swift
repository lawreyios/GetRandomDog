//
//  TextFields.swift
//  LoginWithSwiftUIDemo
//
//  Created by Lawrence Tan on 4/5/20.
//  Copyright © 2020 Lawrence Tan. All rights reserved.
//

import SwiftUI

private struct HorizontalLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        let fill = CGRect(x: .zero, y: .zero, width: rect.size.width, height: rect.size.height)
        var path = Path()
        path.addRoundedRect(in: fill, cornerSize: CGSize(width: 2, height: 2))
        return path
    }
}


private struct HorizontalLine: View {
    
    var color: Color
    
    var body: some View {
        HorizontalLineShape()
            .fill(color)
            .frame(minWidth: .zero, maxWidth: .infinity, minHeight: 1.0, maxHeight: 1.0)
    }
}

struct PlaceholderTextField: View {
    var placeholder: Text
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if text.isEmpty || !text.isEmpty { placeholder }
            TextField("", text: $text)
                .autocapitalization(.none)
            HorizontalLine(color: .black)
        }
    }
}

struct SecurePlaceholderTextField: View {
    var placeholder: Text
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            if text.isEmpty || !text.isEmpty { placeholder }
            SecureField("", text: $text)
                .autocapitalization(.none)
            HorizontalLine(color: .black)
        }
    }
}
