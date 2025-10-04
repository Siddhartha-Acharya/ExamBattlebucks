//
//  FavoriteDetailsPage.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 04/10/25.
//

import SwiftUI

struct FavoriteDetailsPage: View {
    @State var item: Item
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text("\(item.userId)")
                        .bold()
                        .font(.system(size: 17))
                    
                    Text(item.title ?? "")
                        .font(.system(size: 17))
                    
                    Spacer()
                }
                
                Text(item.body ?? "")
                    .font(.system(size: 17))
            }
            .padding(.horizontal, 20)
        }
    }
}

