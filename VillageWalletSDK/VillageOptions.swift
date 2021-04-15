import Foundation

/**
  Options to configure the SDK
 */
public class VillageOptions {
	/** The API key to identify the SDK to the API. */
	let apiKey: String

	/**
	 An initial base URL for the API host to use. Is comprised of the the scheme, host, and any
	 context root for the API paths to use eg: https://myawesomeapp.com/api
	 */
	let baseUrl: String

	/**
	 Which wallet to interact with for everything related to payment instruments, preferences, etc.
	 Applies across the SDK. If a different Wallet is needed, instantiate the SDK again.

	 If not specified, will default to [Wallet.MERCHANT].
	 */
	let wallet: Wallet?

	/** :nodoc **/
	public init(apiKey: String, baseUrl: String, wallet: Wallet?) {
		self.apiKey = apiKey
		self.baseUrl = baseUrl
		self.wallet = wallet
	}

	public convenience init(apiKey: String, baseUrl: String) {
		self.init(apiKey: apiKey, baseUrl: baseUrl, wallet: nil)
	}
}
