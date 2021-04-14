import UIKit

/**
 The JSON request structure of the Import Payment InstrumentsApi endpoint.
 */
public protocol ImportPaymentInstrumentsRequest {
	/* The IDM (Gigya) UID or merchant shopper id of the user. Do NOT use an email address! */
	var uid: String { get }

	/* The merchant shopper id of the user. */
	var shopperId: String { get }

	var creditCards: [PaymentInstrumentRequestCreditCard]? { get }

	var payPal: PayPalDetail? { get }
}

public protocol PayPalDetail {
	/* The PayPalApi customer id. */
	var customerId: String { get }

	/* The PayPalApi email id. */
	var payPalId: String { get }

	/* The PayPalApi payment method token. */
	var paymentMethodToken: String { get }
}

public protocol PaymentInstrumentRequestCreditCard {
	/* WebPay reference in the transaction logs. This number uniquely identifies the transaction in WebPay. */
	var transactionRef: String { get }

	/* The WebPay transaction timestamp. The timestamp format is ISO8601. */
	var transactionTimestamp: String { get }

	/* The merchant order number used in the WebPay transaction. */
	var orderNumber: String { get }

	/* The bin (first 6 digits) of the credit card number used in the WebPay transaction. */
	var bin: String { get }

	/* The suffix (last 4 digits) of the credit card number used in the WebPay transaction. */
	var cardSuffix: String { get }

	/* The amount of the WebPay transaction. */
	var amount: Decimal { get }
}
