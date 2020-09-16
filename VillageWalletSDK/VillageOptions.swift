import Foundation

/**
 Options to configure the SDK
 */
public class VillageOptions {
	/** The API key to identify the SDK to the API. */
	let apiKey: String

	/**
		- Parameter apiKey: The API key to identify the SDK to the API.
	 */
	public init(apiKey: String) {
		self.apiKey = apiKey
	}
}
