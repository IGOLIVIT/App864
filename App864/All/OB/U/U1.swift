//
//  U1.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct U1: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Image("U1")
                        .resizable()
                        .ignoresSafeArea()
                    
                 Image("logo2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                VStack() {
                    
                    Text("Start now and earn more")
                        .foregroundColor(.black)
                        .font(.system(size: 28, weight: .bold))
                        .padding(.vertical)
                    
                    Text("A proven way to make easy money")
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Reviews()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim")))
                    })
                    .padding(.bottom)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 300)
            }
        }
    }
}

#Preview {
    U1()
}
