//
//  ETUDocumentOrderingConfirm.swift
//  ETUDocumentOrdering
//
//  Created by Ekaterina Krapivina on 29.10.2021.
//

import SwiftUI

struct ETUDocumentOrderingConfirm: View {
    @EnvironmentObject var viewModel: ETUDocumentOrderinngViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.document.student.getFullName())
            Text(viewModel.document.education)
            Text(viewModel.document.documentType!)
            Text(viewModel.document.documentSubtype!)
        }
    }
}
