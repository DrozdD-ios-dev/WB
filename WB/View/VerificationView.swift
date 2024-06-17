//
//  VerificationView.swift
//  WB
//
//  Created by Дрозд Денис on 17.06.2024.
//

import SwiftUI

struct VerificationView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Text("Экран верификации")
            .font(.system(size: 24, weight: .bold))
            .multilineTextAlignment(.center)
        Button {
            dismiss()
        } label: {
            Text("Назад")
                .padding()
        }
    }
}

#Preview {
    VerificationView()
}
