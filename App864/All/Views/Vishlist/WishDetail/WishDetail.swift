//
//  WishDetail.swift
//  App864
//
//  Created by IGOR on 30/08/2024.
//

import SwiftUI

struct WishDetail: View {
    
    @StateObject var viewModel: HomeViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Image(viewModel.selectedDesire?.desPhoto ?? "")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 340)
                    .ignoresSafeArea()
                    .overlay(
                    
                        VStack {
                            
                            HStack {
                                
                                Button(action: {
                                    
                                    router.wrappedValue.dismiss()
                                    
                                }, label: {
                                    
                                    Image(systemName: "chevron.left")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .regular))
                                        .padding()
                                        .background(Circle().fill(.gray.opacity(0.05)))
                                })
                                
                                Text(viewModel.selectedDesire?.desName ?? "")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .regular))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: 25).fill(.gray.opacity(0.05)))
                            }
                            
                            Spacer()
                        }
                            .padding()
                    )
                
                VStack {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        HStack {
                            
                            VStack {
                                
                                HStack {
                                    
                                    VStack {
                                        
                                        Text("Total")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("\(viewModel.total)$")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Text("Collected")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                        Text("\(viewModel.selectedDesire?.desCost ?? "")$")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                        
                                        RoundedRectangle(cornerRadius: 50)
                                            .fill(Color("prim"))
                                            .frame(width: 160, height: 80)
                                    }
                                    .frame(width: 165)
                                    
                                    Spacer()
                                    
                                }
                            }
                            
                            VStack {
                                
                                Spacer()
                                
                                HStack {
                                    
                                    
                                    VStack {
                                        
                                        Text("Left")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                        Text("\(viewModel.selectedDesire?.desAcc ?? "")$")
                                            .foregroundColor(.black)
                                            .font(.system(size: 16, weight: .regular))
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                        
                                        RoundedRectangle(cornerRadius: 50)
                                            .fill(Color("prim3"))
                                            .frame(width: 160, height: 40)
                                    }
                                    .frame(width: 165)
                                    
                                    
                                }
                            }
                        }
                        .frame(height: 165)
                        
                        Text("Comment")
                            .foregroundColor(.black)
                            .font(.system(size: 24, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(viewModel.selectedDesire?.desCom ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim2")))
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = true
                        }
                        
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .regular))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim2")))
                    })
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(Color("bg2"))
            }
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteDes(withDesName: viewModel.selectedDesire?.desName ?? "", completion: {
                            
                            viewModel.fetchDesires()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                            viewModel.isDetail = false

                        }
                                
                    }, label: {
                        
                        Text("Delete")
                            .foregroundColor(.red)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                    .padding(.top, 25)
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                        
                    }, label: {
                        
                        Text("Close")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    WishDetail(viewModel: HomeViewModel())
}
