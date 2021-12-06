import Foundation
import UIKit


class DocumentSubtype: Codable {
    var id: Int
    var title: String
    
    init(id: Int, title: String) {
        self.id = id
        self.title = title
    }
}

protocol AnyDocument {
    var id: Int { get }
    var type: String { get set }
    var hasSubTypes: Bool { get }
    var subtypes: [DocumentSubtype] { get }
    var selectedSubtype: DocumentSubtype? { get set }
    var selectedEducation: Int { get set }
    
    func selectSubtype(index: Int)
}

class BaseDocument: AnyDocument {
    var id: Int
    var type: String
    var hasSubTypes: Bool
    var subtypes: [DocumentSubtype]
    var selectedSubtype: DocumentSubtype?
    var selectedEducation: Int
    var student: Student
    
    init(id: Int,
         type: String,
         hasSubTypes: Bool,
         subtypes: [DocumentSubtype],
         selectedSubtype: DocumentSubtype? = nil,
         selectedEducation: Int,
         student: Student) {
        self.id = id
        self.type = type
        self.hasSubTypes = hasSubTypes
        self.subtypes = subtypes
        self.selectedSubtype = selectedSubtype
        self.selectedEducation = selectedEducation
        self.student = student
    }
    
    func selectSubtype(index: Int) {
        self.selectedSubtype = subtypes[index]
    }
}

class DocumentOfStuding: BaseDocument {
    var count: String
    var comment: String
    var heraldicStamp: Bool
    
    override func selectSubtype(index: Int) {
        self.selectedSubtype = self.subtypes[index]
    }
    
    init(id: Int = 0,
         type: String = "Справка об обучении",
         hasSubTypes: Bool = true,
         subtypes: [DocumentSubtype] = [DocumentSubtype(id: 0, title: "На работу родителям/на работу себе"),
                                                 DocumentSubtype(id: 1, title: "Социальный отдел/собес"),
                                                 DocumentSubtype(id: 2, title: "Налоговая инспекция"),
                                                 DocumentSubtype(id: 3, title: "Другое/по требованию"),
                                                 DocumentSubtype(id: 4, title: "Пенсионный фонд/военкомат для иностранных граждан")],
         selectedSubtype: DocumentSubtype? = nil,
         selectedEducation: Int,
         student: Student,
         count: String = "",
         comment: String = "",
         heraldicalStamp: Bool = false) {
        self.count = count
        self.comment = comment
        self.heraldicStamp = heraldicalStamp
        
        super.init(id: id,
                   type: type,
                   hasSubTypes: hasSubTypes,
                   subtypes: subtypes,
                   selectedSubtype: selectedSubtype,
                   selectedEducation: 0,
                   student: student)
    }
}

class DocumentOfIncomes: BaseDocument {
    var count: String
    var startDate: Date?
    var endDate: Date?

    init(id: Int = 1,
         type: String = "Справка о доходах",
         hasSubTypes: Bool = false,
         subtypes: [DocumentSubtype] = [DocumentSubtype(id: 0, title: "Справка о доходах")],
         selectedSubtype: DocumentSubtype? = nil,
         selectedEducation: Int? = 0,
         student: Student,
         count: String = "",
         startDate: Date? = nil,
         endDate: Date? = nil) {
        self.count = count
        self.startDate = startDate
        self.endDate = endDate
        
        super.init(id: id,
                   type: type,
                   hasSubTypes: hasSubTypes,
                   subtypes: subtypes,
                   selectedSubtype: selectedSubtype,
                   selectedEducation: 0,
                   student: student)
        
        self.selectedSubtype = subtypes[0]
    }
    
    override func selectSubtype(index: Int) {
        self.selectedSubtype = subtypes[0]
    }
}

class Document2NDFL: BaseDocument {
    var count: String
    var startDate: Date?
    var endDate: Date?

    init(id: Int = 2,
         type: String = "Справка 2-НДФЛ",
         hasSubTypes: Bool = false,
         subtypes: [DocumentSubtype] = [DocumentSubtype(id: 0, title: "Справка 2-НДФЛ")],
         selectedSubtype: DocumentSubtype? = nil,
         selectedEducation: Int,
         student: Student,
         count: String = "",
         startDate: Date? = nil,
         endDate: Date? = nil) {
        self.count = count
        self.startDate = startDate
        self.endDate = endDate
        
        super.init(id: id,
                   type: type,
                   hasSubTypes: hasSubTypes,
                   subtypes: subtypes,
                   selectedSubtype: selectedSubtype,
                   selectedEducation: 0,
                   student: student)
        
        self.selectedSubtype = subtypes[0]
    }
    
    override func selectSubtype(index: Int) {
        selectedSubtype = subtypes[0]
    }
}
