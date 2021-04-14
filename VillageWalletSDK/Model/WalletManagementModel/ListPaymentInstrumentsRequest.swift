import UIKit

/**
 The JSON request structure of the List Payment InstrumentsApi endpoint.
 */
public protocol ListPaymentInstrumentsRequest {
	/* The IDM (Gigya) UID or merchant shopper id of the user. Do NOT use an email address! */
	var uid: String { get }

	/* The merchant shopper id of the user. */
	var shopperId: String { get }
}
