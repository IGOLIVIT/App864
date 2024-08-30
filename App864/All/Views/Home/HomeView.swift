//
//  HomeView.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct HomeView: View {
    
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
                
                ZStack {
                    
                    Image("ticket")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                 
                    VStack {
                        
                        HStack {
                            
                            Text("\(viewModel.wishs) wishes")
                                .foregroundColor(.black)
                                .font(.system(size: 32, weight: .bold))
                            
                            Spacer()
                            
                            Text("0")
                                .foregroundColor(.black)
                                .font(.system(size: 32, weight: .bold))
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                    .padding()
                                    .background(Circle().fill(Color("prim")))
                            })
                        }
                        .padding(.leading)
                        
                        HStack {
                          
                            Text("you have already fulfilled")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                            
                            Text("in progress")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))

                        }
                        .padding(.horizontal)

                    }
                }
                .padding(.vertical)
                
                Text("The most cherished desires")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)

                if viewModel.desires.isEmpty {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                        
                                        Image("vol")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Text("Click on me!")
                                            .foregroundColor(.black)
                                            .font(.system(size: 22, weight: .semibold))
                                        
                                        Text("and make your dreams come true")
                                            .foregroundColor(.black.opacity(0.6))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    }
                                    .padding(6)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.up.right")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                            .padding(8)
                                            .background(Circle().fill(Color("prim")))
                                            .padding(3)
                                            .background(Rectangle().fill(Color("bg")))
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 170)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            })
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Spacer()
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(8)
                                        .background(Circle().fill(Color("bg2")))
                                        .padding(3)
                                        .background(Rectangle().fill(Color("bg")))
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        }
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Spacer()
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(8)
                                        .background(Circle().fill(Color("bg2")))
                                        .padding(3)
                                        .background(Rectangle().fill(Color("bg")))
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Spacer()
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Image(systemName: "arrow.up.right")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .padding(8)
                                        .background(Circle().fill(Color("bg2")))
                                        .padding(3)
                                        .background(Rectangle().fill(Color("bg")))
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 170)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                        }
                    }
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = true
                                }
                                
                            }, label: {
                                
                                VStack(alignment: .leading, spacing: 7) {
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                        
                                        Image("vol")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Text("Click on me!")
                                            .foregroundColor(.black)
                                            .font(.system(size: 22, weight: .semibold))
                                        
                                        Text("and make your dreams come true")
                                            .foregroundColor(.black.opacity(0.6))
                                            .font(.system(size: 14, weight: .regular))
                                        
                                    }
                                    .padding(6)
                                    
                                    Spacer()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.up.right")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                            .padding(8)
                                            .background(Circle().fill(Color("prim")))
                                            .padding(3)
                                            .background(Rectangle().fill(Color("bg")))
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 170)
                                .background(RoundedRectangle(cornerRadius: 5).fill(Color("bg2")))
                            })
                            
                            ForEach(viewModel.desires, id: \.self) { index in

                                Button(action: {
                                    
                                    viewModel.selectedDesire = index
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                        
                                        Spacer()
                                        
                                        Text(index.desName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20, weight: .medium))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.leading, 5)
                                        
                                        HStack {
                                            
                                            VStack {
                                                
                                                HStack {
                                                    
                                                    Text("\(index.desAcc ?? "")$")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 16, weight: .regular))
                                                    
                                                    Spacer()
                                                    
                                                    Text(index.desCost ?? "")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 16, weight: .regular))
                                                }
                                                
                                                ZStack {
                                                    
                                                    Rectangle()
                                                        .fill(.black)
                                                        .frame(maxWidth: .infinity)
                                                        .frame(height: 3)
                                                    
                                                    HStack {
                                                        
                                                        Rectangle()
                                                            .fill(.white)
                                                            .frame(width: 50, height: 3)
                                                        
                                                        Spacer()
                                                    }
                                                }
                                            }
                                            .frame(maxWidth: .infinity)
                                            
                                            Image(systemName: "arrow.up.right")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .regular))
                                                .padding(8)
                                                .background(Circle().fill(Color("bg2")))
                                                .padding(3)
                                                .background(Rectangle().fill(Color("bg")))
                                        }
                                        .padding(.leading, 5)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 170)
                                    .background(Image(index.desPhoto ?? "").resizable().cornerRadius(5))
                                })
                            }
                        })
                    }
                }

            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchDesires()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddDesire(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            WishDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    HomeView()
}
