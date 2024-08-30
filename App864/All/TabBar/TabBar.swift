//
//  TabBar.swift
//  App864
//
//  Created by IGOR on 24/08/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 8, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color.blue : Color.gray.opacity(0.4))
                            .frame(width: 14, height: 14)

//                        Text(index.rawValue)
//                            .foregroundColor(selectedTab == index ? Color("prim3") : Color.gray.opacity(0.4))
//                            .font(.system(size: 10, weight: .regular))

                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 24)
        .padding(.bottom, 38)
        .background(RoundedRectangle(cornerRadius: 0).fill(Color("bg")))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Home = "Home"
    
    case Vishlist = "Vishlist"
    
    case Notes = "Notes"
                
    case Settings = "Settings"
    
}
