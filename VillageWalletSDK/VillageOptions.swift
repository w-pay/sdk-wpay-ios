import Foundation

/**
  Options to configure the SDK
 */
public class VillageOptions {
	/** The API key to identify the SDK to the API. */
	let apiKey: String

	/**
	 * An initial base URL for the API host to use. Is comprised of the the scheme, host, and any
	 * context root for the API paths to use eg: https://myawesomeapp.com/api
	 */
	let baseUrl: String

	/** :nodoc **/
	public init(apiKey: String, baseUrl: String) {
		self.apiKey = apiKey
		self.baseUrl = baseUrl
	}
}
