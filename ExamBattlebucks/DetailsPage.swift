//
//  DetailsPage.swift
//  ExamBattlebucks
//
//  Created by selegic mac 01 on 03/10/25.
//

import SwiftUI

struct DetailsPage: View {
    @State var item: Model
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text("\(item.userId ?? 0)")
                    .bold()
                    .font(.system(size: 17))
                
                Text(item.title ?? "")
                    .font(.system(size: 17))
                
                Spacer()
            }
            
            Text(item.body ?? "")
                .font(.system(size: 17))
        }
    }
}
