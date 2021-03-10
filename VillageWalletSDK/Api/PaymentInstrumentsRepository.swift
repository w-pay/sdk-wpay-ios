import UIKit

public protocol PaymentInstrumentsRepository {
	/**
	 Retrieve the customer's registered `PaymentInstruments`

	 - Parameter wallet: Whether to return only instruments registered by the customer for the merchant, or for the merchant and Everyday Pay
	 */
	func list(wallet: Wallet, completion: @escaping ApiCompletion<WalletContents>)

	/**
	 Delete a `PaymentInstrument} from a {@link Wallet`

	 - Parameter instrument: The payment instrument to delete.
	 */
	func delete(
		instrument: PaymentInstrumentIdentifier,
		completion: @escaping ApiCompletion<Void>
	)

	/**
	 Initiate the addition of a new `PaymentInstrument` for the customer.

	 To complete the addition the customer will have to use the returned URL details to enter
	 the instrument details.

	 - Parameter instrument: Initial details to begin the addition workflow.
	 */
	func initiateAddition(
		instrument: PaymentInstrumentAddition,
		completion: @escaping ApiCompletion<PaymentInstrumentAdditionResult>
	)
}