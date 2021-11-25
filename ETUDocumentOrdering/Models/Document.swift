import Foundation
import UIKit

//
//struct DocumentType {
//    let type: String
//    let subtypes: [String]
//
//    var hasSubtypes: Bool {
//        return subtypes.count > 1 ? true : false
//    }
//}
//
//class Document {
//    var documentType: String?
//    var documentSubtype: String?
////    let student: Student
////    var education: String
//    var count: Int?
//    var periodStartDate: Date?
//    var peerionEndDate: Date?
//    var comment: String?
//    var heraldicalStamp: Bool = false
//}

class DocumentSubtype: Codable {
    var id: Int
    let title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

protocol AnyDocument: Codable {
    var id: Int { get }
    var type: String { get set }
    var hasSubTypes: Bool { get }
//    var subtypes: [String] { get }
    var subtypes: [DocumentSubtype] { get }
//    var selectedSubtype: Int? { get set }
    var selectedSubtype: DocumentSubtype? { get set }
    var selectedEducation: Int? { get set }
//    var selectedSubtype
    
    
    func selectSubtype(index: Int)
}

class DocumentOfStuding: AnyDocument {
    var id: Int = 0
    var type: String = "Справка об обучении"
    var hasSubTypes: Bool = true
//    var subtypes: [String] = ["На работу родиелям/на работу себе",
//                              "Социальный отдел/собес",
//                              "Налоговая инспекция",
//                              "Другое/по требованию",
//                              "Пенсионный фонд/военкомат для иностранных граждан"]
    var subtypes: [DocumentSubtype] = [DocumentSubtype(id: 0, title: "На работу родиелям/на работу себе"),
                                       DocumentSubtype(id: 1, title: "Социальный отдел/собес"),
                                       DocumentSubtype(id: 2, title: "Налоговая инспекция"),
                                       DocumentSubtype(id: 3, title: "Другое/по требованию"),
                                       DocumentSubtype(id: 4, title: "Пенсионный фонд/военкомат для иностранных граждан")]
//    var selectedSubtype: Int? = nil
    var selectedSubtype: DocumentSubtype?
    var selectedEducation: Int? = 0
    
    func selectSubtype(index: Int) {
//        self.selectedSubtype = index
        self.selectedSubtype = subtypes[index]
    }
}

class DocumentOfIncomes: AnyDocument {
    var id: Int = 1
    var type: String = "Справка о доходах"
    var hasSubTypes: Bool = false
//    var subtypes: [String] = ["Справка о доходах"]
    var subtypes: [DocumentSubtype] = [DocumentSubtype(id: 0, title: "Справка о доходах")]
//    var selectedSubtype: Int? = 0
    var selectedSubtype: DocumentSubtype?
    var selectedEducation: Int?

    init() {
        selectedSubtype = subtypes[0]
    }
    
    func selectSubtype(index: Int) {
        self.selectedSubtype = subtypes[0]
    }
}

class Document2NDFL: AnyDocument {
    var id: Int = 2
    var type: String = "Справка 2-НДФЛ"
    var hasSubTypes: Bool = false
//    var subtypes: [String] = ["Справка 2-НДФЛ"]
    var subtypes: [DocumentSubtype] = [DocumentSubtype(id: 0, title: "Справка 2-НДФЛ")]
//    var selectedSubtype: Int? = 0
    var selectedSubtype: DocumentSubtype?
    var selectedEducation: Int? = 0

    init() {
        selectedSubtype = subtypes[0]
    }
    
    func selectSubtype(index: Int) {
        selectedSubtype = subtypes[0]
    }
}
