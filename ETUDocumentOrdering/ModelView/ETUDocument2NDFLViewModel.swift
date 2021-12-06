import Foundation

final class ETUDocument2NDFLViewModel: ObservableObject {
    @Published var document: Document2NDFL
    
    init(document: Document2NDFL) {
        self.document = document
    }
    
    func raiseValidateError() -> Bool {
        return Int(document.count) == nil && !document.count.isEmpty
    }
    
    func canBeConfirmed() -> Bool {
        return Int(document.count) != nil && document.startDate != nil && document.endDate != nil
    }
}
