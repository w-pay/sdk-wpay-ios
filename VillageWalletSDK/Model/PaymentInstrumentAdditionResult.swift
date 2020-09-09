import UIKit

/**
	The result of trying to initiate the addition of a new `PaymentInstrument`
 */
public protocol PaymentInstrumentAdditionResult {
	/** The URL of an iframe. This iframe is used to capture a credit card number, expiry and CVV */
	var cardCaptureURL: String { get }

	/** Container reference in the transaction logs. This number uniquely identifies the transaction in the container */
	var transactionRef: String? { get }
}
