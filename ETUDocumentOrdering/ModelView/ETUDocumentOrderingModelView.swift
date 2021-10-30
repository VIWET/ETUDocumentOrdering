import Foundation

final class ETUDocumentOrderinngViewModel: ObservableObject {
    let documentTypes: [DocumentType]
    @Published var student: Student!
    @Published var document: Document!
    
    @Published var selectedType: Int! {
        didSet {
            self.document.documentType = documentTypes[selectedType].type
            if documentTypes[selectedType].hasSubtypes {
                selectedSubtype = nil
            } else {
                selectedSubtype = 0
            }
        }
    }
    
    var isTypeSelected: Bool {
        return selectedType != nil
    }
    
    @Published var selectedSubtype: Int? {
        didSet {
            if let selectedSubtype = selectedSubtype {
                self.document.documentSubtype = documentTypes[selectedType].subtypes[selectedSubtype]
            } else {
                self.document.documentSubtype = nil
            }
        }
    }
    
    var isSubtypeSelected: Bool {
        return selectedSubtype != nil
    }
    
    @Published var selectedEducation: Int! = 0 {
        willSet {
            self.document.education = getEducationList()[newValue]
        }
    }

    init() {
        self.documentTypes = [DocumentType(type: "Справка об обучении",
                                           subtypes: ["На работу родиелям/на работу себе",
                                                      "Социальный отдел/собес",
                                                      "Налоговая инспекция",
                                                      "Другое/по требованию",
                                                      "Пенсионный фонд/военкомат для иностранных граждан"]),
                              DocumentType(type: "Справка о доходах",
                                           subtypes: ["Справка о доходах"]),
                              DocumentType(type: "Справка 2-НДФЛ",
                                           subtypes: ["Справка 2-НДФЛ"])]
        
        self.student = getStudent()
        self.document = self.cteateDocumentInstance(student: self.student)
    }
    
    func cteateDocumentInstance(student: Student) -> Document {
        return Document(student: student)
    }
    
    func getStudent() -> Student {
        return Student(lastName: "Иванов",
                       firstName: "Иван",
                       educationList: ["дд.мм.гггг - дд.мм.гггг | ФКТИ: 10.05.01 - Компьютерная безопасность",
                                       "дд.мм.гггг - дд.мм.гггг | ФКТИ: 10.05.01 - Безопасность жизнидеяттельности"],
                       studentCard: "111111")
    }
    
    func getEducationList() -> [String] {
        return self.student.educationList
    }
    
    func getDocumentTypes() -> [String] {
        var types: [String] = []
        for type in documentTypes {
            types.append(type.type)
        }
        return types
    }
    
    func getDocumentSubtypes() -> [String] {
        if let selectedType = selectedType {
            return documentTypes[selectedType].subtypes
        }
        return []
    }
    
    func hasSubtypes() -> Bool {
        if let selectedType = selectedType {
            return documentTypes[selectedType].hasSubtypes
        }
        return false
    }
    
    func canBeConfirmed() -> Bool {
        return isTypeSelected && isSubtypeSelected
    }
}


