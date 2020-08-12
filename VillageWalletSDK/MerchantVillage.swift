import UIKit

public class MerchantVillage<A>: Configurable {
	private let api: VillageMerchantApiRepository
	private let authenticator: AnyApiAuthenticator<A>

	public init(api: VillageMerchantApiRepository, authenticator: AnyApiAuthenticator<A>) {
		self.api = api
		self.authenticator = authenticator
	}

	public func setHost(host: String) {
		authenticator.setHost(host: host)
		api.setHost(host: host)
	}
}
