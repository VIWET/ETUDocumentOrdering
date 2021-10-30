import Foundation

class Student {
    let lastName: String
    let firstName: String
    let patronymic: String?
    
    let educationList: [String]
    let studentCard: String
    
    init(lastName: String, firstName: String, patronymic: String? = nil, educationList: [String], studentCard: String) {
        self.lastName = lastName
        self.firstName = firstName
        self.patronymic = patronymic
        self.educationList = educationList
        self.studentCard = studentCard
    }
    
    public func getFullName() -> String {
        if let patronymic = patronymic {
            return "\(lastName) \(firstName) \(patronymic)"
        } else {
            return "\(lastName) \(firstName)"
        }
    }
}
