import UIKit

public class RequestHeaderChain: RequestHeadersFactory {
	private let factories: [RequestHeaderFactory]

	public init(factories: [RequestHeaderFactory]) {
		self.factories = factories
	}

	public func createHeaders() -> [String: String] {
		var headers = [String: String]()

		factories.forEach { factory in
			factory.addHeaders(headers: &headers)
		}

		return headers
	}
}
