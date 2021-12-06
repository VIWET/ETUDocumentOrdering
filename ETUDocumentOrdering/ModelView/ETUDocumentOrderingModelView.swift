import Foundation

final class ETUDocumentOrderinngViewModel: ObservableObject {
    @Published var student: Student
    @Published var document: BaseDocument!
    @Published var selectedSubtype: Int?
    @Published var selectedEducation: Int! = 0
    
    
    init(student: Student) {
        self.student = student
    }
    
    func getEducationList() -> [String] {
        var educations: [String] = []
        for education in self.student.educations {
            educations.append(education.getFullEducationTitle())
        }
        return educations
    }
    
    func getDocumentTypes() -> [String] {
        return ["Справка об обучении", "Справка о доходах", "Справка 2-НДФЛ"]
    }
    
    func getDocumentSubtypes() -> [String] {
        var subtypes: [String] = []
        if let document = document {
            for subtype in document.subtypes {
                subtypes.append(subtype.title)
            }
        }
        return subtypes
    }

    func canBeConfirmed() -> Bool {
        return document != nil && document?.selectedSubtype != nil
    }
    
    func setDocumentType(index: Int) {
        switch index {
            case 0: self.document = DocumentOfStuding(selectedEducation: selectedEducation, student: student)
            case 1: self.document = DocumentOfIncomes(selectedEducation: selectedEducation, student: student)
            case 2: self.document = Document2NDFL(selectedEducation: selectedEducation, student: student)
            default: self.document = nil
        }
    }
    
    func setDocumentSubtype(index: Int) {
        if self.document != nil {
            self.document?.selectSubtype(index: index)
//            Я НЕ ЗНАЮ ПОЧЕМУ БЕЗ ЭТОЙ СТРОЧКИ НЕ ОТОБРАЖАЕТСЯ ВЫБРАННЫЙ ТИП, ХОТЯ ВНУТРИ МОДЕЛИ ОН УСТАНАВЛИВАЕТСЯ
            self.selectedSubtype = self.document?.selectedSubtype?.id
        }
    }
    
    func setEducation(index: Int) {
        document?.selectedEducation = index
        selectedEducation = index
    }
}

