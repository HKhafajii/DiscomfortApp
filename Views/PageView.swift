//
//  PageView.swift
//  DiscomfortApp
//
//  Created by Hassan Alkhafaji on 5/2/24.
//

//@State var index = 0
//var journal: [Journal] = [Journal(notes: "Sasdasd"), Journal(notes: "132rwer"), Journal(notes: "polo"),Journal(notes: "Sasdasd"), Journal(notes: "132rwer"), Journal(notes: "polo"), Journal(notes: "Sasdasd"), Journal(notes: "132rwer"), Journal(notes: "polo")]

import SwiftUI



struct Journal {
    
    var notes: String
    var image: Image?
    
}

struct PageView: View {
    
    @State private var journal: [Journal] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                
                
                
            }
            .padding(15)
        }
    }
}

#Preview {
    PageView()
}
