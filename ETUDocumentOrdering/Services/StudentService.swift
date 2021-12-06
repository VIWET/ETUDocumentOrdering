import Foundation
import Combine


class StudentService {
    @Published var student: Student!
    
    var studentSubscription: AnyCancellable?
    
    init() {
        self.fetchStudent()
    }
    
    private func fetchStudent() {
        var request = URLRequest(url: URL(string: "https://lk.etu.ru/api/profile/0")!)
        
        request.setValue(PSEUDO_API, forHTTPHeaderField: "Cookie")

        studentSubscription = URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .userInitiated))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                          throw URLError(.badServerResponse)
                      }
                return output.data
             
            }
            .receive(on: DispatchQueue.main)
            .decode(type: Student.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { (completion) in
                switch completion {
                    case .finished: break
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] (student) in
                self?.student = student
                self?.studentSubscription?.cancel()
            })
    }
}
