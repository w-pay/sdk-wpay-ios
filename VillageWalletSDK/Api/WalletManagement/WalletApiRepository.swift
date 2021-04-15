import UIKit

public protocol WalletApiRepository {
	/**
	 Delete a consumers wallet. This API is IP restricted to allow unauthenticated server side calls.

	 - Parameter walletDeleteRequest: Detail of the consumer who will have their the wallet deleted.
	 */
	func delete(
		walletDeleteRequest: WalletDeleteRequest,
		completion: @escaping ApiCompletion<WalletDeleteResponse>
	)
}
