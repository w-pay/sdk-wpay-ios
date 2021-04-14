import UIKit

/**
 The JSON response structure of the Import Payment InstrumentsApi endpoint.
 */
public protocol ImportPaymentInstrumentsResponse {
	/* The IDM (Gigya) UID or merchant shopper id of the user. Do NOT use an email address! */
	var uid: String { get }

	/* The merchant shopper id of the user. */
	var shopperId: String { get }

	var creditCards: [CreditCardResult]? { get }

	var payPal: PayPal? { get }
}

public protocol PayPal {
	/* The PayPalApi customer id. */
	var customerId: String { get }

	/* The PayPalApi email id. */
	var payPalId: String { get }

	/* The PayPalApi payment method token.*/
	var paymentMethodToken: String { get }

	/* The import process result for the paypal instrument. */
	var result: ResultEnum { get }

	/* The import process error message if "result" is "ERROR". Will be null if "result" is not "ERROR". */
	var errorMessage: ErrorMessage? { get }
}

public protocol ErrorMessage {
	var description: String { get }
}

public protocol CreditCardResult {
	/* WebPay reference in the transaction logs. This number uniquely identifies the transaction in WebPay. */
	var transactionRef: String { get }

	/* The WebPay transaction timestamp. The timestamp format is ISO8601. */
	var transactionTimestamp: String { get }

	/* The WebPay transaction type. */
	var transactionType: String { get }

	/* The WebPay transaction response code. */
	var transactionResponseCode: String { get }

	/* The WebPay transaction response text. */
	var transactionResponseText: String { get }

	/* The merchant order number used in the WebPay transaction. */
	var orderNumber: String { get }

	/* The bin (first 6 digits) of the credit card number used in the WebPay transaction. */
	var bin: String { get }

	/* The suffix (last 4 digits) of the credit card number used in the WebPay transaction. */
	var cardSuffix: String { get }

	/* The month of the expiry date of the credit card. */
	var expiryMonth: String { get }

	/* The year of the expiry date of the credit card. */
	var expiryYear: String { get }

	/* The amount of the WebPay transaction. */
	var amount: Decimal { get }

	/* The import process result for the credit card instrument.*/
	var result: ResultEnum { get }

	var errorMessage: ErrorMessage? { get }
}

public enum ResultEnum : String {
	case OK, DUP, EXP, ERROR
}
