//
//  ETUTextField.swift
//  ETUDocumentOrdering
//
//  Created by Ekaterina Krapivina on 11.11.2021.
//

import SwiftUI

struct ETUTextField: View {
    let title: String
    let isDisabled: Bool
    @Binding var text: String
    
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(FontsManager.OpenSansCondensed.bold, size: 14))
                    .foregroundColor(Color.etuColors.blue.opacity(0.6))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(0)
            TextField("", text: $text)
                .disabled(isDisabled)
                .textFieldStyle(ETUTextFieldStyle())
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .fill(!text.isEmpty ? Color.etuColors.selectedValue : Color.white)
                )
        }
    }
}
