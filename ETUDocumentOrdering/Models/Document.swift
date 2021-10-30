import Foundation
import UIKit


struct DocumentType {
    let type: String
    let subtypes: [String]
    
    var hasSubtypes: Bool {
        return subtypes.count > 1 ? true : false
    }
}

class Document {
    var documentType: String?
    var documentSubtype: String?
    let student: Student
    var education: String
    var count: Int?
    var periodStartDate: Date?
    var peerionEndDate: Date?
    var comment: String?
    var heraldicalStamp: Bool = false
    
    init(student: Student) {
        self.student = student
        self.education = student.educationList[0]
    }
}
