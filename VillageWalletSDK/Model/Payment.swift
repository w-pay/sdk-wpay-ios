import UIKit

/**
	Properties common to all Payments and Payment Requests
*/
public protocol Payment {
	/** The ID of this payment request */
	var paymentRequestId: String { get }

	/** The unique reference for the payment as defined by the Merchant */
	var merchantReferenceId: String { get }

	/** The gross amount to be paid. Must be positive except for refunds */
	var grossAmount: Decimal { get }
}
