import UIKit

/**
 Options unique to using the Merchant API operations.
 */
public class VillageMerchantOptions : VillageOptions {
	/**
	 If given, the merchant ID will be added to the headers.

	 Since the merchant ID identifies the merchant it can be overridden with another value by the
	 API gateway which uses the authentication token to identify the merchant.
	*/
	public let merchantId: String?

	/** :nodoc */
	public init(
		apiKey: String,
		baseUrl: String,
		wallet: Wallet? = nil,
		merchantId: String? = nil
	) {
		self.merchantId = merchantId

		super.init(apiKey: apiKey, baseUrl: baseUrl, wallet: wallet)
	}
}

/**
 Factory function type to give to SDK factory functions to instantiate a new API repository instance.
 */
public typealias MerchantApiRepositoryFactory = (
	_ options: VillageMerchantOptions,
	_ headers: RequestHeadersFactory,
	_ authenticator: AnyApiAuthenticator<HasAccessToken>
) -> VillageMerchantApiRepository

public class MerchantVillage {
	/**
	 Entry point into the SDK for merchants.

	 - Parameter options:
	 - Parameter token: An access token or ApiAuthenticator instance for obtaining an access token, or nothing.
	 - Parameter repository: A factory function to create a new API repository instance.
	 */
	public func createSDK(
		options: VillageMerchantOptions,
		token: ApiTokenType,
		repository: MerchantApiRepositoryFactory
	) -> VillageMerchantApiRepository {
		var (headers, authenticator) = createSDKComponents(options: options, token: token);

		if let merchantId = options.merchantId {
			headers.append(MerchantIdRequestHeader(merchantId: merchantId))
		}

		return repository(options, RequestHeaderChain(factories: headers), authenticator)
	}
}
