//
//  LoginView.swift
//  thestation
//
//  Created by Paul Crews on 7/7/23.
//

import SwiftUI
import SwiftData
import PhotosUI

struct LoginView: View {
    @State var new_user : Bool = false
    @Query var active_user : [User]
    @State var user:User
    @State var field_width: CGFloat = 0.0
    @State var pass_confirm: String = ""
    @Environment(\.modelContext) private var modelContext
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    var body: some View {
        VStack{
                VStack{
                    
                    VStack{
                        Text("Sign \(new_user ? "up" : "in")  with a provider")
                            .font(.title)
                            .fontWeight(.bold)
                        Button(action: {
                            print("Apple Sign In")
                        }, label: {
                            Text("Sign \(new_user ? "up" : "in") with Apple")
                        })
                        .padding()
                        .frame(width: 300)
                        .background(.black)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.top, 1.5)
                        Button(action: {
                            print("Google Sign In")
                        }, label: {
                            Text("Sign \(!new_user ? "in" : "up") with Google")
                        })
                        .padding()
                        .frame(width: 300)
                        .background(.red)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.top, 1.5)
                    }.frame(width: 500)
                    
                    Divider()
                    
                    VStack(alignment: .leading, content: {
                        Text("Or use your email")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                        if new_user{
                            HStack{
                                Spacer()
                                PhotosPicker("Upload Avatar", selection: $avatarItem, matching: .images)
                                
                                if let avatarImage{
                                    avatarImage
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300, height: 300)
                                }
                            }
                        }
                            LoginFormField(binder: $user.email, secured: false, title: "Email")

                            LoginFormField(binder: $user.username, secured: false, title: "Username")
                            .frame(width: field_width, height: new_user ? 30 : 0)
                                .opacity(new_user ? 1 : 0)
                                .padding(.vertical, new_user ? 10 :  0)
                        
                            LoginFormField(binder: $user.password, secured: true, title: "Password")

                            LoginFormField(binder: $pass_confirm, secured: true, title: "Confirm Password")
                                .frame(width: field_width, height: new_user ? 30 : 0)
                                .opacity(new_user ? 1 : 0)
                                .padding(.vertical, new_user ? 10 :  0)
                        
                        HStack{
                            if new_user{
                                    Toggle("Light Mode", isOn: $user.light_mode)
                                    Toggle("Private", isOn: $user.is_private)
                            }
                            Toggle(isOn: $new_user, label: {
                                Text("New User?")
                            }).onChange(of: new_user) { oldValue, newValue in
                                withAnimation(.easeInOut(duration: 0.84)) {
                                    if new_user{
                                        if UIDevice.current.orientation.isLandscape {
                                            field_width = 400
                                        }
                                        field_width = 350
                                    } else {
                                        field_width = 0
                                    }
                                }
                            }

                        }
                    })
                    .frame(width: 350)
                }
            
        }
        .frame(width: 350)
        .padding(.horizontal, 15)
        .onChange(of: avatarImage) { oldValue, newValue in
            Task {
                if let data = try? await avatarItem?.loadTransferable(type: Data.self){
                    if let uiImage = UIImage(data: data) {
                        avatarImage = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView(user:dummy_user)
}
