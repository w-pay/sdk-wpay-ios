import UIKit

public class WalletIdRequestHeader: RequestHeaderFactory {
	public init() {

	}

	public func addHeaders(headers: inout [String: String]) -> Void {
		headers[X_WALLET_ID] = "10006"
	}
}