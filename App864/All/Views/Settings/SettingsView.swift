//
//  SettingsView.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image(viewModel.PPhoto)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Hello")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("\(viewModel.PName)!")
                    .foregroundColor(.black)
                    .font(.system(size: 26, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 25)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            VStack(spacing: 17) {
                                
                                HStack {
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("bg2"))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(width: 25, height: 25)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                        .frame(maxWidth: .infinity)
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("bg2"))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(width: 25, height: 25)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                        .frame(maxWidth: .infinity)
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("bg2"))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(width: 25, height: 25)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                        .frame(maxWidth: .infinity)
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(Color("bg2"))
                                        .font(.system(size: 12, weight: .regular))
                                        .frame(width: 25, height: 25)
                                        .background(RoundedRectangle(cornerRadius: 5).fill(.white))
                                        .frame(maxWidth: .infinity)
                                }
                                
                                Text("Rate us")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Rate")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        })
                        
                        Button(action: {
                            
                            guard let url = URL(string: "https://www.termsfeed.com/live/9c6d71c3-794a-4001-a90b-b54d4877f9fe") else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            VStack(spacing: 17) {
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Read")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 45)
                                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("prim2")))
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                        })
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
