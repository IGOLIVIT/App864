//
//  AddWish.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct AddWish: View {

    @StateObject var viewModel: WiahlistViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 40, height: 4)
                
                Text("Wishlist")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.wPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentWPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentWPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 70, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.gray))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentWPhoto)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .cornerRadius(25)
                            }
                        })
                        .padding(.bottom)
                        
                        Text("Name")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.wName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.wName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        
                        Text("Cost")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.wCost.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.wCost)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))

                    }
                }
                
                Button(action: {
                    
                    
                    viewModel.wishs += 1
                    
                    viewModel.wPhoto = viewModel.currentWPhoto
                    
                    viewModel.addWish()
                    
                    viewModel.wName = ""
                    viewModel.wCost = ""
                    viewModel.currentWPhoto = ""
                    
                    viewModel.fetchWishs()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }

                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(viewModel.wName.isEmpty || viewModel.wCost.isEmpty ? Color.gray : Color("prim2")))
                })
                .disabled(viewModel.wName.isEmpty || viewModel.wCost.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddWish(viewModel: WiahlistViewModel())
}
