//
//  FormField.swift
//  thestation
//
//  Created by Paul Crews on 7/8/23.
//

import SwiftUI

struct LoginFormField: View {
    @State var binder: Binding<String>
    @State var secured: Bool
    @State var title: String
    
    var body: some View {
        if !secured{
            TextField(title, text: binder)
                .padding()
                .background(.ultraThinMaterial)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
        } else {
            SecureField(title, text: binder)
                .padding()
                .background(.ultraThinMaterial)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

//#Preview {
//    @State var  b = "Bind"
//    LoginFormField(binder: $b,  secured: false, title: "Mix")
//}
