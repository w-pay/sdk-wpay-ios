import UIKit

public protocol PaymentInstrumentsRepository {
	/**
	 Get the specified payment instrument of the customer.

	 - Parameter paymentToken: The payment token of the payment instrument to fetch.
	 - Parameter publicKey: A public key used to encrypt sensitive instrument data and include that encrypted data in the response sent back to the consumer.
	 */
	func getByToken(
		paymentToken: String,
		publicKey: String?,
		completion: @escaping ApiCompletion<IndividualPaymentInstrument>
	)

	/**
	 Retrieve the customer's registered `PaymentInstruments`
	 */
	func list(completion: @escaping ApiCompletion<WalletContents>)

	/**
	 Delete a `PaymentInstrument` from a `Wallet`

	 - Parameter instrument: The payment instrument to delete.
	 */
	func delete(
		instrument: String,
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