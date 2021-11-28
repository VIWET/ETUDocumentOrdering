import Foundation
import Combine

final class ETUDocumentOrderingMenuViewModel: ObservableObject {
    @Published var student: Student!
    private let studentService: StudentService = StudentService()
    private var cancellables: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init() {
        self.addSubscribers()
    }
    
    func addSubscribers() {
        studentService.$student
            .sink { [weak self] (student) in
                self?.student = student
            }
            .store(in: &cancellables)
    }
}
