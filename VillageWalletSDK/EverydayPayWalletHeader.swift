import UIKit

public class EverydayPayWalletHeader: RequestHeaderFactory {
	let options: VillageOptions

	/** :nodoc */
	public init(options: VillageOptions) {
		self.options = options
	}

	/**
		- See: `RequestHeaderFactory.addHeaders(...)`
	 */
	public func addHeaders(headers: inout [String: String]) {
		headers[X_EVERYDAY_PAY_WALLET] = String(options.wallet == Wallet.EVERYDAY_PAY)
	}
}
