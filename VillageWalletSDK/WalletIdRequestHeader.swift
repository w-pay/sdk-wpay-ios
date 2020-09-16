import UIKit

/**
	Adds the Wallet ID to the request
 */
public class WalletIdRequestHeader: RequestHeaderFactory {
	/** :nodoc */
	public init() {

	}

	/**
		- See: `RequestHeaderFactory.addHeaders(...)`
   */
	public func addHeaders(headers: inout [String: String]) -> Void {
		headers[X_WALLET_ID] = "10006"
	}
}