import UIKit

/**
	Adds the API key to the request
 */
public class ApiKeyRequestHeader: RequestHeaderFactory {
	private let options: VillageOptions

	/**
		- Parameter options: What api key to add to the request
	 */
	public init(options: VillageOptions) {
		self.options = options
	}

	/**
		- See: `RequestHeaderFactory.addHeaders(...)`
	 */
	public func addHeaders(headers: inout [String: String]) {
		headers[X_API_KEY] = options.apiKey
	}
}
