//
//  ZoomControlView.swift
//  NtionalGeography
//
//  Created by Yacine on 9/9/23.
//

import SwiftUI

struct ZoomControlView: View {
    @Binding var imageScale: CGFloat
    @Binding var imageOffset: CGSize
    
    var body: some View {
        HStack(spacing: 15){
            Button {
                if imageScale > 1 {
                    withAnimation(.spring()){
                        imageScale -= 1
                        if imageScale == 1{
                            imageOffset = .zero
                        }
                    }
                }
            } label: {
                Image(systemName: "minus.magnifyingglass")
            }
            
            Button {
                    withAnimation(.spring()){
                        imageScale = imageScale > 1 ? 1 : 5
                        if imageScale == 1{
                            imageOffset = .zero
                        }
                    }
            } label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            }
            
            Button {
                if imageScale < 5 {
                    withAnimation(.spring()){
                        imageScale += 1
                    }
                }
            } label: {
                Image(systemName: "plus.magnifyingglass")
            }

        }
        .font(.system(size: 30,design: .rounded))
        .foregroundColor(.white)
        .padding(.horizontal,20)
        .padding(.vertical,10)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        
    }
}

struct ZoomControlView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomControlView(imageScale: .constant(1),imageOffset: .constant(.zero))
    }
}
