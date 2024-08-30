//
//  LoadingView.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color("bg2")
                .ignoresSafeArea()
            
            VStack {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(80)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding(.bottom, 90)
            }
        }
    }
}

#Preview {
    LoadingView()
}
