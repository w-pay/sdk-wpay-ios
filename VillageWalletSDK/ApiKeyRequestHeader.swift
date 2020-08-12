import UIKit

public class ApiKeyRequestHeader: RequestHeaderFactory {
	private let options: VillageOptions

	public init(options: VillageOptions) {
		self.options = options
	}

	public func addHeaders(headers: inout [String: String]) {
		headers[X_API_KEY] = options.apiKey
	}
}
