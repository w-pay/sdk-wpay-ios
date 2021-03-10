import UIKit

/**
	Adds the Wallet ID to the request
 */
public class WalletIdRequestHeader: RequestHeaderFactory {
	private let walletId: String

	/** :nodoc */
	public init(walletId: String) {
		self.walletId = walletId
	}

	/**
		- See: `RequestHeaderFactory.addHeaders(...)`
   */
	public func addHeaders(headers: inout [String: String]) -> Void {
		headers[X_WALLET_ID] = walletId
	}
}