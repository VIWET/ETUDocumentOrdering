import Foundation

final class ETUDocumentOfIncomesViewModel: ObservableObject {
    @Published var document: DocumentOfIncomes
    
    init(document: DocumentOfIncomes) {
        self.document = document
    }
    
    func raiseValidateError() -> Bool {
        return Int(document.count) == nil && !document.count.isEmpty
    }
    
    func canBeConfirmed() -> Bool {
        return Int(document.count) != nil && document.startDate != nil && document.endDate != nil
    }
}

