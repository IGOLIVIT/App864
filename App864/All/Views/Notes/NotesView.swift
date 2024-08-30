//
//  NotesView.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct NotesView: View {
    
    @StateObject var viewModel = NotesViewModel()
    
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
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }

                }, label: {
                    
                    Text("Add article")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 30).fill(Color("prim2")))
                })
                
                if viewModel.notes.isEmpty {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 7) {
                                
                                Image("vol")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                
                                Text("Click on me!")
                                    .foregroundColor(.black)
                                    .font(.system(size: 22, weight: .semibold))
                                
                                Text("and add article")
                                    .foregroundColor(.black.opacity(0.6))
                                    .font(.system(size: 14, weight: .regular))
                                
                            }
                            .frame(width: 130)
                            
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .padding()
                                .background(Circle().fill(Color("prim")))
                        }
                        .frame(maxHeight: .infinity)
                        
                    })
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.notes, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedNote = index
                                    
                                    withAnimation(.spring()) {
                                        
                                        viewModel.isDetail = true
                                    }
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 8) {
                                        
                                        Image(index.notPhoto ?? "")
                                            .resizable()
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 180)
                                        
                                        Text(index.notName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .regular))
                                        
                                        Text(index.notST ?? "")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 16, weight: .regular))
                                    }
                                })
                            }
                        }
                    }
                }
                
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchNotes()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddNote(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            NotDetail(viewModel: viewModel)
        })
    }
}

#Preview {
    NotesView()
}
