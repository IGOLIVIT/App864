//
//  VishlistView.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct VishlistView: View {

    @StateObject var viewModel = WiahlistViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
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
                    
                }
                .padding()

                    VStack {
                        
                        HStack {
                            
                            ForEach(viewModel.types, id: \.self) { index in
                                
                                HStack {
                                    
                                    Button(action: {
                                        
                                        viewModel.currentType = index
                                        
                                    }, label: {
                                        
                                        VStack {
                                            
                                            Text(index)
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                                .frame(maxWidth: .infinity)
                                         
                                            Rectangle()
                                                .fill(.black)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 1)
                                                .opacity(viewModel.currentType == index ? 1 : 0)
                                        }
                                    })
                                }
                            }
                        }
                        
                        if viewModel.wishes.isEmpty {
                            
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
                                        
                                        Text("and make your dreams come true")
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
                            
                            if viewModel.currentType == "Wishlist" {
                                
                                ScrollView(.vertical, showsIndicators: false) {
                                    
                                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                        
                                        ForEach(viewModel.getFilteredPodcasts(), id: \.self) { index in
                                                
                                                VStack(alignment: .leading, spacing: 4) {
                                                    
                                                    Image(index.wPhoto ?? "")
                                                        .resizable()
                                                        .frame(maxWidth: .infinity)
                                                        .frame(height: 150)
                                                        .overlay(
                                                            
                                                            VStack {
                                                                
                                                                HStack {
                                                                    
                                                                    Spacer()
                                                                    
                                                                    Menu(content: {
                                                                        
                                                                        Button(action: {
                                                                            
                                                                            viewModel.selectedWish = index
                                                                            
                                                                            withAnimation(.spring()) {
                                                                                
                                                                                viewModel.isDelete = true
                                                                            }
                                                                            
                                                                        }, label: {
                                                                            
                                                                            Text("Delete card")
                                                                                .foregroundColor(.red)
                                                                                .font(.system(size: 15, weight: .regular))
                                                                        })
                                                                        
                                                                    }, label: {
                                                                        
                                                                        Image(systemName: "ellipsis")
                                                                            .foregroundColor(.black)
                                                                            .padding(20)
                                                                            .background(Circle().fill(Color("bg2")))
                                                                            .padding(3)
                                                                    })
                                                                }
                                                                
                                                                Spacer()
                                                            }
                                                        )
                                                    
                                                    Text(index.wName ?? "")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 16, weight: .medium))
                                                    
                                                    Text("\(index.wCost ?? "")$")
                                                        .foregroundColor(.black)
                                                        .font(.system(size: 15, weight: .regular))

                                                        Text("bought")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .medium))
                                                            .padding(5)
                                                            .frame(maxWidth: .infinity)
                                                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                                    
                                                }

                                        }
                                    })
                                }
                                
                            }  else {
                            
                            ScrollView(.vertical, showsIndicators: false) {
                                
                                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                                    
                                    ForEach(viewModel.getFilteredPodcasts2(), id: \.self) { index in
                                            
                                            VStack(alignment: .leading, spacing: 4) {
                                                
                                                Image(index.wPhoto ?? "")
                                                    .resizable()
                                                    .frame(maxWidth: .infinity)
                                                    .frame(height: 150)
                                                    .overlay(
                                                        
                                                        VStack {
                                                            
                                                            HStack {
                                                                
                                                                Spacer()
                                                                
                                                                Menu(content: {
                                                                    
                                                                    Button(action: {
                                                                        
                                                                        withAnimation(.spring()) {
                                                                            
                                                                            viewModel.isDelete = true
                                                                        }
                                                                        
                                                                    }, label: {
                                                                        
                                                                        Text("Delete card")
                                                                            .foregroundColor(.red)
                                                                            .font(.system(size: 15, weight: .regular))
                                                                    })
                                                                    
                                                                    Button(action: {
                                                                        
                                                                        viewModel.favoritesManager(model: index)

                                                                    }, label: {
                                                                        
                                                                        Text("Move to wishlist")
                                                                    })
                                                                    
                                                                }, label: {
                                                                    
                                                                    Image(systemName: "ellipsis")
                                                                        .foregroundColor(.black)
                                                                        .padding(20)
                                                                        .background(Circle().fill(Color("bg2")))
                                                                        .padding(3)
                                                                })
                                                            }
                                                            
                                                            Spacer()
                                                        }
                                                    )
                                                
                                                Text(index.wName ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 16, weight: .medium))
                                                
                                                Text("\(index.wCost ?? "")$")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .regular))

                                            }
                                    }
                                })
                            }
                        }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                    .ignoresSafeArea()
                
            }
            
            VStack {
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.spring()) {
                        
                        viewModel.isAdd = true
                    }
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .regular))
                        .padding()
                        .background(Circle().fill(Color("prim")))
                })
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            }
        }
        .onAppear {
            
            viewModel.fetchWishs()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddWish(viewModel: viewModel)
        })
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
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        
                        CoreDataStack.shared.deleteWish(withPName: viewModel.selectedWish?.wName ?? "", completion: {
                            
                            viewModel.fetchWishs()
                        })
          
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false

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
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                        
                    })
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    VishlistView()
}
