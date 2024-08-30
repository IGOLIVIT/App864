//
//  ContentView.swift
//  App864
//
//  Created by IGOR on 23/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Home

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {

                        HomeView()
                            .tag(Tab.Home)

                        VishlistView()
                            .tag(Tab.Vishlist)
                        
                        NotesView()
                            .tag(Tab.Notes)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                TabBar(selectedTab: $current_tab)

                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                R1()
            }
        }
    }
}

#Preview {
    ContentView()
}
