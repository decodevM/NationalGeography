//
//  ControlImageScaleView.swift
//  NtionalGeography
//
//  Created by Yacine on 9/9/23.
//

import SwiftUI

struct ControlImageScaleView: View {
    @Binding var imageScale: CGFloat
    
    var body: some View {
        HStack(spacing: 15){
            Button {
                if imageScale > 1 {
                    withAnimation(.spring()){
                        imageScale -= 1
                    }
                }
            } label: {
                Image(systemName: "minus.magnifyingglass")
            }
            
            Button {
                    withAnimation(.spring()){
                        imageScale = imageScale > 1 ? 1 : 5
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

struct ControlImageScaleView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageScaleView(imageScale: .constant(1))
    }
}
