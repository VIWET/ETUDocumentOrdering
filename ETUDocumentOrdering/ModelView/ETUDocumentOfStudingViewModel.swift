import Foundation

final class ETUDocumentOfStudingViewModel: ObservableObject {
    @Published var document: DocumentOfStuding
    
    init(document: DocumentOfStuding) {
        self.document = document
    }
    
    func raiseValidateError() -> Bool {
        return Int(document.count) == nil && !document.count.isEmpty
    }
    
    func canBeConfirmed() -> Bool {
        return Int(document.count) != nil
    }
}
