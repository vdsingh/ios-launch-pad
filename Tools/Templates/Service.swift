import Foundation

protocol {{ModuleName}}Interface {
    func fetchData() async throws -> String
}

final class {{ModuleName}}: {{ModuleName}}Interface {
    func fetchData() async throws -> String {
        // Simulating network delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "Data from {{ModuleName}}Service"
    }
}

class Mock{{ModuleName}}: {{ModuleName}}Interfacel {
    var shouldSucceed: Bool = true
    var mockData: String = "Mock data from {{ModuleName}}Service"

    func fetchData() async throws -> String {
        if shouldSucceed {
            return mockData
        } else {
            throw NSError(domain: "Mock{{ModuleName}}ServiceError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Mock error"])
        }
    }
}
