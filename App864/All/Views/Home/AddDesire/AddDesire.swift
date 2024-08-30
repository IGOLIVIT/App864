//
//  AddDesire.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct AddDesire: View {
    
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 40, height: 4)
                
                Text("Desires")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .regular))
                    .padding(.vertical)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 14) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.desPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentDesPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentDesPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 70, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.gray))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentDesPhoto)
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
                                .opacity(viewModel.desName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.desName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        
                        Text("How much does it cost")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.desCost.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.desCost)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        
                        Text("How much has been accumulated?")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.desAcc.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.desAcc)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        
                        Text("Comment")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Name")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.desCom.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.desCom)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                    }
                }
                
                Button(action: {
                    
                    viewModel.total += Int(viewModel.desCost) ?? 0
                    
                    viewModel.desPhoto = viewModel.currentDesPhoto
                    
                    viewModel.addDesire()
                    
                    viewModel.desName = ""
                    viewModel.desCost = ""
                    viewModel.desAcc = ""
                    viewModel.desCom = ""
                    
                    viewModel.fetchDesires()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }

                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(viewModel.desName.isEmpty || viewModel.desCost.isEmpty || viewModel.desAcc.isEmpty || viewModel.desCom.isEmpty ? Color.gray : Color("prim2")))
                })
                .disabled(viewModel.desName.isEmpty || viewModel.desCost.isEmpty || viewModel.desAcc.isEmpty || viewModel.desCom.isEmpty ? true : false)
            }
            .padding()
        }
    }
}

#Preview {
    AddDesire(viewModel: HomeViewModel())
}
