//
//  ZoomPositionPanelView.swift
//  NtionalGeography
//
//  Created by Yacine on 9/9/23.
//

import SwiftUI

struct ZoomPositionPanelView: View {
     var imageScale: CGFloat
     var imageOffset: CGSize
    @State private var hidePanelInformations: Bool = true
    var body: some View {
        HStack{
            Button {
                withAnimation(.spring()){
                    hidePanelInformations.toggle()
                }
            } label: {
                Image(systemName: "circle.circle")
                    .symbolRenderingMode(.hierarchical)
            }.font(.system(size: 30,design: .rounded))
                .foregroundColor(.white)
            
            
            if !hidePanelInformations{
                HStack(spacing: 15){
                    Label(String(format: "%.3f", imageScale), systemImage: "arrow.up.left.and.arrow.down.right")

                    Label(String(format: "%.3f", imageOffset.height), systemImage: "arrow.up.and.down")
                    
                    Label(String(format: "%.3f", imageOffset.width), systemImage: "arrow.left.and.right")
                }.padding(.horizontal,5)
            }
            
            
//            .opacity(hidePanelInformations ? 0 : 1)
//            .animation(.spring(), value: hidePanelInformations)
        }
        .padding(5)
        .foregroundColor(.white)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        
    }
}

struct ZoomPositionPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ZoomPositionPanelView(imageScale: 1, imageOffset: .zero)
            .previewLayout(.sizeThatFits)
    }
}
