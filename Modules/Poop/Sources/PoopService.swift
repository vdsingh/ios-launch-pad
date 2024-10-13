import Foundation

protocol PoopServiceProtocol {
    func fetchData() async throws -> String
}

final class PoopService: PoopServiceProtocol {
    func fetchData() async throws -> String {
        // Simulating network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "Data from PoopService"
    }
}

class MockPoopService: PoopServiceProtocol {
    var shouldSucceed: Bool = true
    var mockData: String = "Mock data from PoopService"

    func fetchData() async throws -> String {
        if shouldSucceed {
            return mockData
        } else {
            throw NSError(domain: "MockPoopServiceError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
    }
}
