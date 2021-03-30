import UIKit

/**
 The JSON request structure of the Payments endpoint
 */
public protocol DigitalPayPaymentRequest {
	/**
	 Transaction type containers to use for all instruments.

	 This object is only required if the payments request contains apple pay instruments.
	 */
	var transactionType: DigitalPayTransactionType { get }

	/** A merchant application specific reference number. This number should uniquely identify the transaction in the merchant’s system. */
	var clientReference: String { get }

	/** The merchant order number of the transaction. */
	var orderNumber: String { get }

	/** This object is only required if the payments request contains paypal instruments. */
	var shippingAddress: DigitalPayAddress { get }

	/** List of payments */
	var payments: [DigitalPayPayment] { get }

	/** Extended merchant data */
	var extendedMerchantData: [ExtendedMerchantData]? { get }

	/** Set to null to skip the cybersource fraud check. */
	var fraudPayload: DigitalPayFraudPayload? { get }

	/** Store data */
	var storeData: DigitalPayStoreData? { get }
}

public protocol DigitalPayPayment {
	/**
	 The payment instrument id from the card capture iframe response or the list payment instruments response.

	 This property can be omitted if the payment token property is present.
	 */
	var paymentInstrumentId: String { get }

	/**
	 The payment token from the card capture iframe response or the list payment instruments response.

	 This property can be omitted if the payment instrument id property is present.
	 */
	var paymentToken: String { get }

	/** The amount you want to pay with the payment instrument. */
	var amount: Decimal { get }

	/**
	 The step-up token is used to track additional credit card information (eg. CVV and expiry) attached to the payment instrument.

	 It's only valid for a predefined time and if an expired step-up token is used during payment, the payment for that instrument will fail and the user will have to get a new step-up token before retrying the payment. A step-up token is returned in the response of a credit card iframe.

	 This property is currently only required for credit card instruments and only if specific credit card information (eg. CVV and expiry) is required during payment.
	 */
	var stepUpToken: String? { get }

	/**
	 The passcode is used to send additional information (eg. gift card PIN) for the payment instrument.

	 This property is currently only required for gift card instruments and only if the gift card PIN is required during payment.

	 This property should NOT be used with credit card instruments (see stepUpToken).
	 */
	var passcode: String? { get }
}

public protocol DigitalPayStoreData {
	/** The in-store payment transaction store id. */
	var storeId: String { get }

	/** The in-store payment transaction store id. This is a 12 digit \"0\" [zero] padded numeric string. */
	var rrn: String { get }

	/** The in-store payment transaction timestamp. The timestamp format is milliseconds since epoch. */
	var transactionTimestamp: Decimal { get }
}

public protocol ExtendedMerchantData {
	/** The name of the extended merchant data field. */
	var field: String { get }

	/** The value of the extended merchant data field. */
	var value: String { get }
}
