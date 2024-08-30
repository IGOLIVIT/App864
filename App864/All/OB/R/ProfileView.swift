//
//  ProfileView.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = HomeViewModel()
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 20) {
                
                Text("Let's create your profile!")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .bold))
                    .multilineTextAlignment(.center)
                
                Text("Add your name and avatar")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .regular))
                
                Menu(content: {
                    
                    ForEach(viewModel.avPhotos, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.selPPhoto = index
                            
                        }, label: {
                            
                            Image(index)
                            
                        })
                    }
                    
                }, label: {
                    
                    if viewModel.selPPhoto.isEmpty {
                        
                        Image(systemName: "person.circle")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .regular))
                            .frame(width: 80, height: 80)
                            .background(Circle().stroke(.white))
                            .overlay(
                            
                                VStack {
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text("+")
                                            .foregroundColor(.white)
                                            .font(.system(size: 13, weight: .regular))
                                            .padding(4)
                                            .background(Circle().fill(.blue))
                                    }
                                }
                            )
                        
                    } else {
                        
                        Image(viewModel.selPPhoto)
                            .resizable()
                            .frame(width: 90, height: 90)
                    }
                })
                .padding()
                
                ZStack(alignment: .leading, content: {
                    
                    Text("Name")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .regular))
                        .opacity(viewModel.enterName.isEmpty ? 1 : 0)
                    
                    TextField("", text: $viewModel.enterName)
                        .foregroundColor(Color.white)
                        .font(.system(size: 14, weight: .semibold))
                    
                })
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white))
                .padding(.horizontal)
                
                
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.PPhoto = viewModel.selPPhoto
                    viewModel.PName = viewModel.enterName
                    
                    status = true

                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim")))
                })
                .padding()
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    ProfileView()
}
