//
//  ContentView.swift
//  DiscomfortApp
//
//  Created by Hassan Alkhafaji on 4/30/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color.gray.opacity(0.8)
                    .ignoresSafeArea()
                VStack {
                    
                    TitleView()
                    
                    Spacer()
                    
                    NavLink(link: AnyView(CreatePage()), image: Image(systemName: "plus"))
                        .padding()
                        
                    NavLink(link: AnyView(SettingsPage()), name: "Settings", image: Image(systemName: "gear"))
                        .padding()
                    NavLink(link: AnyView(PageView()), name: "Pages", image: Image(systemName: "book.pages"))
                        
                    Spacer()

                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    MainView()
}


struct TitleView: View {
    var body: some View {
        VStack {
            Text("App Name")
                .padding()
                .background()
                .fontWeight(.semibold)
                .font(.system(size: 36))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .gray, radius: 10, x: 0, y: 10)
        }
            
    }
}

struct NavLink: View {
    
    var link: AnyView
    var name: String?
    var image: Image
    
    var body: some View {
        NavigationStack{
            
            NavigationLink {
                    link
            } label: {
                HStack {
                    if let name = name {
                        Text(name)
                    }
                    image
                        .imageScale(.medium)
                }
                .padding()
                .foregroundStyle(.black)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .gray, radius: 10, x: 0, y: 10)
                
            }

        }
    }
}
