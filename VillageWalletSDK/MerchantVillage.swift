import UIKit

/**
 Entry point into the SDK for merchants. It is responsible for managing the relationship between
 the app concerns, and calling the API.
 */
public class MerchantVillage<A>: Configurable {
	private let api: VillageMerchantApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	/**
		- Parameter api: The API repository to use
		- Parameter authenticator: The `ApiAuthenticator` to use to obtain authorisation needed to access the API
	 */
	public init(api: VillageMerchantApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	/**
		Allows the application to change the host the SDK sends API requests too.

		This allows the application to read data from an outside source (eg: a QR code) and have
		the SDK use the same host.

		- See: `Configurable.setHost(...)`
	 */
	public func setHost(host: String) {
		authenticator.setHost(host: host)
		api.setHost(host: host)
	}
}
