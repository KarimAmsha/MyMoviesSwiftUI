//
//  AlertView.swift
//  MyMoviesSWiftUI
//
//  Created by Karim Amsha on 18.06.2023.
//

import SwiftUI

struct AlertView: View {
    @Binding var message: String

    var body: some View {
        HStack(spacing: 8) {
            Text(message)
                .foregroundColor(.white)
                .font(.system(size: 16))
        }
        .padding(16)
        .background(Color.lightPrimary().cornerRadius(12))
        .padding(.horizontal, 16)
    }
}
