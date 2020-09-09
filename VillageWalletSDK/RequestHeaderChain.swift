import UIKit

/**
	A `RequestHeadersFactory` that populates the HTTP request headers Dictionary using a list of `RequestHeaderFactory`s
 */
public class RequestHeaderChain: RequestHeadersFactory {
	private let factories: [RequestHeaderFactory]

	/**
		- Parameter factories: The list of `RequestHeaderFactory`s to use.
	 */
	public init(factories: [RequestHeaderFactory]) {
		self.factories = factories
	}

	/**
		- See: `RequestHeadersFactory.createHeaders(...)`
   */
	public func createHeaders() -> [String: String] {
		var headers = [String: String]()

		factories.forEach { factory in
			factory.addHeaders(headers: &headers)
		}

		return headers
	}
}
