import UIKit

/**
 Options unique to using the Customer API operations.
 */
public class VillageCustomerOptions : VillageOptions {
	/** :nodoc **/
	public init(apiKey: String, baseUrl: String, walletId: String?) {
		self.walletId = walletId

		super.init(apiKey: apiKey, baseUrl: baseUrl)
	}

	/**
	 If given, the wallet ID will be added to the headers.

	 Since the wallet ID identifies the customer it can be overridden with another value by the
	 API gateway which uses the authentication token to identify the customer.
	 */
	var walletId: String?
}

/**
 Factory function type to give to SDK factory functions to instantiate a new API repository instance.
 */
typealias CustomerApiRepositoryFactory = (
	_ options: VillageCustomerOptions,
	_ headers: RequestHeadersFactory,
	_ authenticator: AnyApiAuthenticator<HasAccessToken>
) -> VillageCustomerApiRepository

/**
 Entry point into the SDK for customers.

 - Parameter options:
 - Parameter token: An access token or ApiAuthenticator instance for obtaining an access token, or nothing.
 - Parameter repository: A factory function to create a new API repository instance.
 */
func createCustomerSDK(
	options: VillageCustomerOptions,
	token: ApiTokenType,
	repository: CustomerApiRepositoryFactory
) -> VillageCustomerApiRepository {
	var (headers, authenticator) = createSDKComponents(options: options, token: token);

	if let walletId = options.walletId {
		headers.append(WalletIdRequestHeader(walletId: walletId))
	}

	return repository(options, RequestHeaderChain(factories: headers), authenticator)
}