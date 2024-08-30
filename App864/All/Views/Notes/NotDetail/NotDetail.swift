//
//  NotDetail.swift
//  App864
//
//  Created by IGOR on 24/08/2024.
//

import SwiftUI

struct NotDetail: View {
    
    @StateObject var viewModel = NotesViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(.gray)
                    .frame(width: 40, height: 4)
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Image(viewModel.selectedNote?.notPhoto ?? "")
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 180)
                        
                        Text(viewModel.selectedNote?.notName ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .regular))
                        
                        Text(viewModel.selectedNote?.notST ?? "")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .regular))
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    NotDetail(viewModel: NotesViewModel())
}
