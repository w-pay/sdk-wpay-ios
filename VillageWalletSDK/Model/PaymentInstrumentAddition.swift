import UIKit

/**
	Initiate the addition of a new payment instrument for this customer.

	This API returns a URL to be used to access the DigiPay IFrame based interface to request the customer to enter a payment instrument details.
 */
public protocol PaymentInstrumentAddition {
	/** The unique reference for this interaction as defined by the client application */
	var clientReference: String { get }

	/** Which wallet to store the new instrument in */
	var wallet: Wallet { get }
}
