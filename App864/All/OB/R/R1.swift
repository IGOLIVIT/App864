//
//  R1.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 17) {
                
                Text("Hello!")
                    .foregroundColor(.white)
                    .font(.system(size: 38, weight: .bold))
                
                Text("This is your dream diary")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .regular))
                
                Text("First, let's get to know each other")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                NavigationLink(destination: {
                    
                    ProfileView()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Start")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .frame(width: 240, height: 50)
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                })
            }
        }
    }
}

#Preview {
    R1()
}
