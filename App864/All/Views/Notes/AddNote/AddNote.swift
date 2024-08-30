//
//  AddNote.swift
//  App864
//
//  Created by IGOR on 24/08/2024.
//

import SwiftUI

struct AddNote: View {

    @StateObject var viewModel: NotesViewModel
    
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
                            
                            ForEach(viewModel.notPhotos, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.currentNotPhoto = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.currentNotPhoto.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim2"))
                                    .font(.system(size: 70, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 180)
                                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(.gray))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.currentNotPhoto)
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
                                .opacity(viewModel.notName.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notName)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        
                        Text("Subtitle")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.notST.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notST)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))
                        
                        Text("Text")
                            .foregroundColor(.black)
                            .font(.system(size: 14, weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Enter")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.notTxt.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.notTxt)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .medium))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 20).stroke(Color("prim2")))

                    }
                }
                
                Button(action: {
                    
                    viewModel.notPhoto = viewModel.currentNotPhoto
                    
                    viewModel.addNote()
                    
                    viewModel.notName = ""
                    viewModel.notST = ""
                    viewModel.notTxt = ""
                    viewModel.currentNotPhoto = ""
                    
                    viewModel.fetchNotes()
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }

                }, label: {
                    
                    Text("Save")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(viewModel.notName.isEmpty || viewModel.notST.isEmpty || viewModel.notTxt.isEmpty ? Color.gray : Color("prim2")))
                })
                .disabled(viewModel.notName.isEmpty || viewModel.notST.isEmpty || viewModel.notTxt.isEmpty ? true : false)
                
                Button(action: {
                    
                    viewModel.notName = ""
                    viewModel.notST = ""
                    viewModel.notTxt = ""
                    viewModel.currentNotPhoto = ""
                                        
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = false
                    }

                }, label: {
                    
                    Text("Delete")
                        .foregroundColor(Color("prim2"))
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).stroke(Color("prim2")))
                })
            }
            .padding()
        }
    }
}

#Preview {
    AddNote(viewModel: NotesViewModel())
}
