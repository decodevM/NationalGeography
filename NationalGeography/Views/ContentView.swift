//
//  ContentView.swift
//  NationalGeography
//
//  Created by Yacine on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    // Properties
    let covers: [CoverModel] = coversData
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var selectedCoverId: Int = 1
    var body: some View {
        VStack{
            Image(covers.first(where: { cover in
                return cover.id == selectedCoverId
            })?.name ?? "")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .padding()
                .shadow(color: .black.opacity(0.3), radius: 20,x: 10,y: 10)
                .scaleEffect(imageScale)
                
            
            // 1: Double tap gesture
                .onTapGesture(count: 2) {
                    withAnimation(.spring()){
                        if imageScale == 1 {
                            imageScale = 3
                        }else if (imageScale == 3){
                            imageScale = 6
                        }else{
                            imageScale = 1
                            imageOffset = .zero
                        }
                    }
                }
            // 2: Drage gesture
                .offset(imageOffset)
                .gesture(DragGesture()
                    .onChanged({ dragPosition in
                        
                        withAnimation(.spring()){
                            imageOffset = dragPosition.translation
                        }
                    }).onEnded({ dragPosition in
                        withAnimation(.spring()){
                            if imageScale <= 1 {
                                imageOffset = .zero
                            }
                        }
                    })
                )
            // 3: Magnification gesture
                .gesture(MagnificationGesture().onChanged({ scale in
                    withAnimation(.spring()){
                        imageScale = scale
                    }
                }).onEnded({ scale in
                    withAnimation(.spring()){
                        if scale < 1 {
                            imageScale = 1
                        }else if scale > 6 {
                            imageScale = 6
                        }else{
                            imageScale = scale
                        }
                    }
                    
                })
                )
                // Panel overlay
                .overlay(alignment: .topLeading) {
                    ZoomPositionPanelView(imageScale: imageScale, imageOffset: imageOffset)
                        .padding()
                        .padding(5)
                }
                //Drawer overlay
                .overlay(alignment: .topTrailing) {
                    MiniDrawerView(covers: covers,selectedCoverId: $selectedCoverId)
                        .padding(.top,20)
                    
                }
                // Zoom control overlay
                .overlay(alignment: .bottom){
                    ZoomControlView(imageScale: $imageScale, imageOffset: $imageOffset)
                }
            
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
