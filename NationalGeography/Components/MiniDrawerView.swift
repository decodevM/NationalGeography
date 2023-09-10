//
//  MiniDrawerView.swift
//  NationalGeography
//
//  Created by Yacine on 9/9/23.
//

import SwiftUI

struct MiniDrawerView: View {
    let covers: [CoverModel]
    @State var isDrawerOpened: Bool = false
    @Binding var selectedCoverId: Int
    var body: some View {
        HStack{
            Button {
                withAnimation(.spring()){
                    isDrawerOpened.toggle()
                }
            } label: {
                
                Image(systemName:isDrawerOpened ? "chevron.compact.right" : "chevron.compact.left")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40,alignment: .center)
                    .foregroundColor(.secondary)
                    .padding(.leading,8)
                    
            }

            
                Spacer()
            
            ScrollView(.horizontal){
                HStack{
                    ForEach(covers) { item in
                        Button {
                            selectedCoverId = item.id
                        } label: {
                            Image(item.thumbnail)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70,alignment: .center)
                                .cornerRadius(8)
                                .padding(.horizontal,2)
                        }

                    }
                }
            }.padding(5)
        }
        .frame(width: 280)
        .background(.thinMaterial)
        .cornerRadius(10)
        .offset(x: isDrawerOpened ? 0 : 250)
    }
}

struct MiniDrawerView_Previews: PreviewProvider {
    static var previews: some View {
        MiniDrawerView(covers: coversData,selectedCoverId: .constant(1))
            .previewLayout(.sizeThatFits)
            
    }
}
