import Foundation

protocol CheeseInterface {
    func fetchData() async throws -> String
}

final class Cheese: CheeseInterface {
    func fetchData() async throws -> String {
        // Simulating network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "Data from CheeseService"
    }
}

class MockCheese: CheeseInterfacel {
    var shouldSucceed: Bool = true
    var mockData: String = "Mock data from CheeseService"

    func fetchData() async throws -> String {
        if shouldSucceed {
            return mockData
        } else {
            throw NSError(domain: "MockCheeseServiceError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
    }
}
