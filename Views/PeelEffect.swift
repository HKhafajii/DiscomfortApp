//
//  PeelEffect.swift
//  DiscomfortApp
//
//  Created by Hassan Alkhafaji on 5/3/24.
//

import SwiftUI

// custom view builder
struct PeelEffect<Content: View>: View {
    var content: Content
    var onDelete: () -> ()
    
    init(@ViewBuilder content: @escaping () -> Content, onDelete: @escaping () -> ()) {
        self.content = content()
        self.onDelete = onDelete
    }
    
    // view properties
    @State private var dragProgress: CGFloat = 0
    var body: some View {
        content
        // Masking original content
            .mask{
                GeometryReader { geometry in
                    
                    let rect = geometry.frame(in: .global)
                    
                    Rectangle()
                        .padding(.trailing, dragProgress * rect.width)
                    
                }
            }
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    let size = $0.size
                    
                    content
                        .offset(x: size.width)
                        .contentShape(Rectangle())
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    // right to left swipe: negative value
                                    var translationX = value.translation.width
                                    // limiting to max zero
                                    translationX = max(translationX, 0)
                                    //converting translation into progress
                                    let progress = min(1, translationX / size.width)
                                    dragProgress = progress
                                }).onEnded({ value in
                                    // Smooth ending animation
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                                        dragProgress = .zero
                                    }
                                    
                                })
                        )
                    
                    
                }
            }
    }
}

#Preview {
    PeelEffect()
}
